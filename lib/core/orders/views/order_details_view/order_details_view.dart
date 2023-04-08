import 'package:amimpact/core/orders/models/my_orders_model/order.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/core/orders/widgets/order_details_view/bill_details.dart';
import 'package:amimpact/core/orders/widgets/order_details_view/order_details_widget.dart';
import 'package:amimpact/core/orders/widgets/order_details_view/payment_method.dart';
import 'package:amimpact/core/orders/widgets/order_details_view/shipping_address.dart';
import 'package:amimpact/core/orders/widgets/order_details_view/total_bill_widget.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("التفاصيل"),
      ),
      body: ListView(
        children: [
          OrderDetailsWidget(
            order: order,
          ),
          buildTitleWidget(context, "العنوان والشحن"),
          ShippingAddressWidget(
            order: order,
          ),
          buildTitleWidget(context, "إجمالي الفاتورة"),
          TotalBillWidget(item: order),
          buildTitleWidget(context, "تفاصيل الدفع"),
          PaymentMethodWidget(
            order: order,
          )
        ],
      ),
    );
  }

  Widget buildTitleWidget(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xffF3F3F3),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .kufi12BoldTextStyle
            .copyWith(color: Colors.black),
      ),
    );
  }
}
