import 'package:amimpact/core/orders/models/shipping_methods_model/datum.dart';
import 'package:amimpact/core/orders/stores/checkout_store/checkout_store.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ShippingMethods extends StatelessWidget {
  const ShippingMethods({Key? key, required this.store}) : super(key: key);
  final CheckoutStore store;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "طريقة  الشحن",
              style: TextStyle(fontFamily: kBeinFont, fontSize: 14),
            ),
          ),
          ...(store.shippingMethods ?? []).map(
            (e) => Observer(
              builder: (_) => GestureDetector(
                onTap: () {
                  store.pickedShippingMethod = e;
                  store.getPaymentMethod();
                },
                child: Row(
                  children: [
                    Radio<ShippingMethod>(
                      value: e,
                      activeColor: Colors.green,
                      groupValue: store.pickedShippingMethod,
                      onChanged: (ShippingMethod? value) {
                        store.pickedShippingMethod = value;
                        store.getPaymentMethod();
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.carrierTitle ?? "",
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: kBeinFont,
                            color: Color(0xff454545),
                          ),
                        ),
                        Text(
                          e.methodTitle ?? "",
                          style: const TextStyle(
                            fontSize: 11,
                            fontFamily: kBeinFont,
                            color: Color(0xff454545),
                          ),
                        ),
                        Text(
                          "السعر : ${e.priceInclTax ?? 0} ريال",
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: kBeinFont,
                            color: Color(0xff454545),
                          ),
                        ),
                        const Divider(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },);
  }
}
