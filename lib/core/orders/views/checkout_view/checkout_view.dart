import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/core/orders/stores/checkout_store/checkout_store.dart';
import 'package:amimpact/core/orders/widgets/checkout/payment_method.dart';
import 'package:amimpact/core/orders/widgets/checkout/personal_information.dart';
import 'package:amimpact/core/orders/widgets/checkout/pick_address.dart';
import 'package:amimpact/core/orders/widgets/checkout/shipping_method.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final CheckoutStore _store = CheckoutStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return LoadingWidget(
        isLoading: _store.loading,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("الدفع"),
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                PickAddress(
                  store: _store,
                ),
                if (_store.address != null) ...[
                  const Divider(),
                  PersonalInformation(store: _store),
                  const Divider(),
                  ShippingMethods(store: _store),
                  const Divider(),
                  PaymentMethods(store: _store),
                  Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: _store.isValid
                          ? Theme.of(context).greenColor
                          : Colors.grey,
                      onPressed: _store.isValid ? _store.confirmOrder : null,
                      child: const Text(
                        "إتمام الطلب",
                        style: TextStyle(
                          fontFamily: kHacinFont,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      );
    },);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }
}
