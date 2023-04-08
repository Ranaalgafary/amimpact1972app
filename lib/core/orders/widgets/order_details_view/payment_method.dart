import 'package:amimpact/core/orders/models/my_orders_model/order.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: Row(
        children: [
          Text(
            "وسيلة الدفع : ",
            style: Theme.of(context)
                .textTheme
                .kufi14RegularTextStyle
                .copyWith(color: Colors.black),
          ),
          Text(
            order.getPaymentMethod(order.payment?.method ?? ""),
            style: const TextStyle(
              color: Color(0xff565353),
              fontFamily: kBeinFont,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
