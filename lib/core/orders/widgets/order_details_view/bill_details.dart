import 'package:amimpact/core/orders/models/my_orders_model/order_item.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';

class BillDetailsWidget extends StatelessWidget {
  const BillDetailsWidget({Key? key, required this.item}) : super(key: key);
  final OrderItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              buildTitle(context, "السعر"),
              buildValueText(context, item.price.toString())
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              buildTitle(context, "الكمية"),
              buildValueText(
                context,
                "${item.qtyOrdered ?? 0}",
                showCurrency: false,
              )
            ],
          ),
          const SizedBox(height: 8),
          // Row(
          //   children: [
          //     buildTitle(context, "الشحن"),
          //     buildValueText(context, "لا يوجد سعر")
          //   ],
          // ),
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
              buildValueText(context, item.rowTotalInclTax.toString())
            ],
          )
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context, String text) {
    return SizedBox(
      width: 70,
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
