// ignore_for_file: avoid_dynamic_calls

import 'dart:io';

import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/models/login_model/address.dart';
import 'package:amimpact/core/orders/models/attachment_model.dart';
import 'package:amimpact/core/orders/models/payment_methods_model/payment_method.dart';
import 'package:amimpact/core/orders/models/payment_methods_model/payment_methods_model.dart';
import 'package:amimpact/core/orders/models/shipping_methods_model/datum.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/orders/views/orders_view/orders_view.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/utils/network_services/orders_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'checkout_store.g.dart';

class CheckoutStore = CheckoutStoreBase with _$CheckoutStore;

abstract class CheckoutStoreBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @observable
  bool loading = false;
  @observable
  Address? address;
  @observable
  List<ShippingMethod>? shippingMethods;
  @observable
  File? file;
  @observable
  ShippingMethod? pickedShippingMethod;

  @observable
  PaymentMethodsModel? paymentMethodsModel;

  @observable
  PaymentMethodsModel? paymentMethods;
  @observable
  num? cashOnDeliveryFee;
  @observable
  PaymentMethod? pickedPaymentMethod;

  Future setAddress(Address address) async {
    loading = true;
    paymentMethods = null;
    pickedPaymentMethod = null;

    firstNameController.text = address.firstname ?? "";
    lastNameController.text = address.lastname ?? "";
    phoneController.text = address.telephone ?? "";
    emailController.text = locator<AccountStore>().user?.email ?? "";
    this.address = address;
    await getShippingMethods();
  }

  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }

  Future getShippingMethods() async {
    loading = true;
    shippingMethods =
        await locator<OrdersService>().getShippingMethods(address!);
    loading = false;
  }

  Future getCashOnDeliveryPrice() async {
    loading = true;
    cashOnDeliveryFee = await locator<OrdersService>().getCashOnDeliveryPrice(
      address: address!,
      carrierCode: pickedShippingMethod!.carrierCode!,
      shippingMethodCode: pickedShippingMethod!.methodCode!,
    );
    loading = false;
  }

  Future getPaymentMethod() async {
    paymentMethods = null;
    pickedPaymentMethod = null;
    loading = true;
    paymentMethods = await locator<OrdersService>().getPaymentMethods(
      address: address!,
      carrierCode: pickedShippingMethod!.carrierCode!,
      shippingMethodCode: pickedShippingMethod!.methodCode!,
    );
    await getCashOnDeliveryPrice();

    loading = false;
  }

  Future confirmOrder() async {
    if (isValid) {
      if (pickedPaymentMethod?.title == "تحويل بنكي" && file == null) {
        locator<UiHelper>().showErrorMessage("أرفق الإيصال أولا");

        return false;
      }
      loading = true;
      final res = await locator<OrdersService>().confirmOrder(
        address: address!,
        paymentMethod: pickedPaymentMethod?.code ?? "",
      );
      if (res! is Map<String, dynamic>) {
        if (pickedPaymentMethod?.title == "تحويل بنكي") {
          await uploadFile(res['orderId'].toString());
        }
        await locator<CartStore>().init();
        locator<NavHelper>().pushReplacement(const OrdersView());
      } else {
        locator<UiHelper>().showErrorMessage(res.toString());
      }
      loading = false;
    }
  }

  bool get isValid =>
      pickedPaymentMethod != null &&
      pickedShippingMethod != null &&
      address != null;

  Future attachFile() async {
    final res = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (res != null) {
      file = File(
        res.path,
      );
    }
  }

  Future uploadFile(String orderId) async {
    loading = true;
    final res = await locator<OrdersService>()
        .attachFile(file: file!, orderId: orderId);
    if (res is AttachmentModel) {
      return true;
    } else {
      locator<UiHelper>().showErrorMessage(res.toString());
    }
    loading = false;
  }
}
