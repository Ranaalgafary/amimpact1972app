import 'package:amimpact/core/orders/models/my_orders_model/order.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({Key? key, required this.order})
      : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "عنوان الشحن",
              style: Theme.of(context)
                  .textTheme
                  .kufi14RegularTextStyle
                  .copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.green,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                order.extensionAttributes?.shippingAssignments?.first.shipping
                        ?.address?.street
                        ?.join(",") ??
                    "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: kBeinFont,
                  fontSize: 14,
                  color: Color(0xff444444),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            width: double.infinity,
            child: Text(
              "طريقة الشحن",
              style: Theme.of(context)
                  .textTheme
                  .kufi14RegularTextStyle
                  .copyWith(color: Colors.black),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  order.getShippingName(
                    order.extensionAttributes?.shippingAssignments?.first
                            .shipping?.method
                            .toString() ??
                        "",
                  ),
                  style: const TextStyle(
                    fontFamily: kBeinFont,
                    fontSize: 14,
                    color: Color(0xff444444),
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 24,
              // ),
              // Text(
              //   "إستلام في مقر الشركة",
              //   style: Theme.of(context)
              //       .textTheme
              //       .kufi12RegularTextStyle
              //       .copyWith(color: const Color(0xff808080)),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
