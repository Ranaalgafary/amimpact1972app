import 'package:amimpact/core/orders/models/my_orders_model/order.dart';
import 'package:amimpact/core/orders/models/my_orders_model/order_item.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';

class TotalBillWidget extends StatelessWidget {
  const TotalBillWidget({Key? key, required this.item}) : super(key: key);
  final Order item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          if (item.payment?.method == "cashondelivery")
            Row(
              children: [
                buildTitle(context, "الدفع عند الإستلام", width: 130),
                buildValueText(
                  context,
                  (item.extensionAttributes?.cashOnDelivry ?? 0).toString(),
                )
              ],
            ),
          const SizedBox(height: 8),
          Row(
            children: [
              buildTitle(context, "الشحن"),
              buildValueText(
                  context,
                  item.extensionAttributes?.shippingAssignments?.isEmpty ?? true
                      ? "0"
                      : "${item.extensionAttributes!.shippingAssignments!.first.shipping?.shipmentAmount ?? 0}")
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              buildTitle(context, "الضريبة"),
              buildValueText(context, item.taxAmount.toString())
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              buildTitle(context, "الإجمالي"),
              buildValueText(context, item.grandTotal.toString())
            ],
          )
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context, String text, {double? width}) {
    return SizedBox(
      width: width ?? 70,
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .kufi14RegularTextStyle
                .copyWith(color: Colors.black),
          ),
          const Spacer(),
          Text(
            " : ",
            style: Theme.of(context)
                .textTheme
                .kufi14RegularTextStyle
                .copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget buildValueText(
    BuildContext context,
    String text, {
    bool showCurrency = true,
  }) {
    return Text(
      "$text   ${showCurrency ? "ر.س" : ""}",
      style: const TextStyle(
        color: Color(0xff565353),
        fontFamily: kBeinFont,
        fontSize: 12,
      ),
    );
  }
}
