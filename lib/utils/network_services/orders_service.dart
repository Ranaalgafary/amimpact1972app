// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/models/login_model/address.dart';
import 'package:amimpact/core/orders/models/attachment_model.dart';
import 'package:amimpact/core/orders/models/cart_model/cart_model.dart';
import 'package:amimpact/core/orders/models/my_orders_model/my_orders_model.dart';
import 'package:amimpact/core/orders/models/my_orders_model/order.dart';
import 'package:amimpact/core/orders/models/payment_methods_model/payment_methods_model.dart';
import 'package:amimpact/core/orders/models/shipping_methods_model/datum.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_helper.dart';
import 'package:dio/dio.dart';

class OrdersService {
  final _dio = locator<NetworkHelper>().dio;

  Future<CartModel?> getCart() async {
    try {
      final res = await _dio.post(
        "create_cart",
        data: {
          "customer_token": locator<AccountStore>().token,
          "customer_id": locator<AccountStore>().user?.id
        },
      );
      log(res.data.toString());
      return CartModel.fromMap(res.data as Map<String, dynamic>);
    } catch (_) {}
    return null;
  }

  Future<bool> removeCartItem(
      {required int itemId, required int cartId}) async {
    try {
      final res = await _dio.post(
        "delete_item_cart",
        data: {
          "customer_token": locator<AccountStore>().token,
          "cart_id": cartId,
          "item_id": itemId
        },
      );
      if (res.data is bool && res.data as bool) {
        return true;
      }
    } catch (_) {}
    return false;
  }

  Future addCartItem({
    required String sku,
    required int cartId,
    required int qty,
  }) async {
    try {
      final res = await _dio.post(
        "add_get_cart",
        data: {
          "customer_token": locator<AccountStore>().token,
          "quote_id": cartId,
          "sku": sku,
          "qty": qty
        },
      );
      if (res.data["message"] == null) {
        return true;
      } else {
        return res.data["message"].toString();
      }
    } catch (_) {}
    return "فشلت العملية";
  }

  Future updateCartItem({
    required String sku,
    required int cartId,
    required int qty,
    required int itemId,
  }) async {
    try {
      final res = await _dio.post(
        "update_item_cart",
        data: {
          "customer_token": locator<AccountStore>().token,
          "quote_id": cartId,
          "sku": sku,
          "qty": qty,
          "item_id": itemId,
          "cart_id": cartId,
        },
      );
      if (res.data["message"] == null) {
        return true;
      } else {
        return res.data["message"].toString();
      }
    } catch (_) {}
    return "فشلت العملية";
  }

  Future<MyOrdersModel?> getMyOrders() async {
    try {
      final res = await _dio.post(
        "my_orders",
        data: {
          "customer_token": locator<AccountStore>().token,
          // "customerId": "1580591"
          "customerId": locator<AccountStore>().user?.id
        },
      );
      log(res.data.toString());
      return MyOrdersModel.fromMap(
          (res.data as List).first as Map<String, dynamic>);
    } catch (_) {}
    return null;
  }

  Future<List<ShippingMethod>> getShippingMethods(Address address) async {
    try {
      final res = await _dio.post("shipping_methods", data: {
        "token": locator<AccountStore>().token,
        "customerId": locator<AccountStore>().user?.id,
        "firstname": address.firstname,
        "lastname": address.lastname,
        "regionCode": address.region?.regionCode,
        "region_id": address.regionId,
        "region": address.region?.region,
        "country_id": "SA",
        "city": address.city,
        "street": address.street?.join(","),
        "telephone": address.telephone,
        "email": locator<AccountStore>().user?.email,
      });
      return (res.data as List<dynamic>?)
              ?.map((e) => ShippingMethod.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [];
    } catch (_) {
      return [];
    }
  }

  Future<num?> getCashOnDeliveryPrice(
      {required Address address,
      required String carrierCode,
      required String shippingMethodCode}) async {
    try {
      final res = await _dio.post(
        "shipping_information_new",
        data: {
          "shipping_carrier_code": carrierCode,
          "shipping_method_code": shippingMethodCode,
          "token": locator<AccountStore>().token,
          "customerId": locator<AccountStore>().user?.id,
          "firstname": address.firstname,
          "lastname": address.lastname,
          "regionCode": address.region?.regionCode,
          "region_id": address.regionId,
          "region": address.region?.region,
          "country_id": "SA",
          "city": address.city,
          "street": address.street?.join(","),
          "telephone": address.telephone,
          "email": locator<AccountStore>().user?.email,
        },
      );
      return res.data?['cod'] as num? ?? 0;
    } catch (_) {
      return 0;
    }
  }

  Future<PaymentMethodsModel?> getPaymentMethods(
      {required Address address,
      required String carrierCode,
      required String shippingMethodCode}) async {
    try {
      final res = await _dio.post(
        "shipping_information",
        data: {
          "shipping_carrier_code": carrierCode,
          "shipping_method_code": shippingMethodCode,
          "token": locator<AccountStore>().token,
          "customerId": locator<AccountStore>().user?.id,
          "firstname": address.firstname,
          "lastname": address.lastname,
          "regionCode": address.region?.regionCode,
          "region_id": address.regionId,
          "region": address.region?.region,
          "country_id": "SA",
          "city": address.city,
          "street": address.street?.join(","),
          "telephone": address.telephone,
          "email": locator<AccountStore>().user?.email,
        },
      );
      return PaymentMethodsModel.fromMap(res.data as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future confirmOrder({
    required Address address,
    required String paymentMethod,
  }) async {
    try {
      final res = await _dio.post(
        "payment_information",
        data: {
          "token": locator<AccountStore>().token,
          "firstname": address.firstname,
          "lastname": address.lastname,
          "regionCode": address.region?.regionCode,
          "region_id": address.regionId,
          "region": address.region?.region,
          "country_id": "SA",
          "city": address.city,
          "street": address.street?.join(","),
          "telephone": address.telephone,
          "email": locator<AccountStore>().user?.email,
          "method": paymentMethod
        },
      );
      if (res.data is String) {
        return {"orderId": res.data};
      } else {
        return res.data["message"].toString();
      }
    } catch (_) {
      return "فشلت العملية";
    }
  }

  Future attachFile({required File file, required String orderId}) async {
    try {
      final res = await Dio().post(
        // "https://amimpact1972.com/ar/orderattachment/attachment/upload/",
        // "https://amimpact1972.com/ar/orderattachment/attachment/upload/quote_id/${locator<CartStore>().cart?.id}/?isAjax=true",
        "https://amimpact1972.com/ar/orderattachment/attachment/upload/order_id/${orderId}/?isAjax=true",
        data: FormData.fromMap({
          "order-attachment[]": await MultipartFile.fromFile(
            file.path,
            filename: file.path.split("/").last,
          )
        }),
        options: Options(
          headers: {"x-requested-with": "XMLHttpRequest"},
        ),
      );
      return AttachmentModel.fromMap(
          json.decode(res.data.toString()) as Map<String, dynamic>);
    } catch (_) {
      return "فشلت العملية";
    }
  }
}
