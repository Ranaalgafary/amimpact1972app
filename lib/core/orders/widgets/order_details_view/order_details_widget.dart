import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/orders/models/my_orders_model/order.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/core/orders/widgets/order_details_view/bill_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: (order.orderItems ?? [])
          .map(
            (e) => Column(
              children: [
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      // const SizedBox(
                      //   width: 130,
                      //   child: CachedImage(
                      //     url:
                      //         "https://amimpact.b-cdn.net/pub/media/mf_webp/png/media/catalog/product/cache/847acd8d0f811ce6d09a6821d7cba734/7/8/781027-1.webp",
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                      Expanded(
                        child: Column(
                          children: [
                            buildTitleWidget(context, "تفاصيل الطلب"),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  e.name ?? "",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .kufi12RegularTextStyle
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              width: double.infinity,
                              child: Text(
                                "طلب : ${e.orderId}",
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .kufi12RegularTextStyle
                                    .copyWith(
                                      color: const Color(0xff565353),
                                    ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "الحالة : ${order.getStatus()}",
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .kufi12RegularTextStyle
                                          .copyWith(
                                            color: const Color(0xff565353),
                                          ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      child: Text(
                                        DateFormat("d/MM/yyyy").format(
                                          DateTime.parse(order.createdAt ?? ""),
                                        ),
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .kufi12RegularTextStyle
                                            .copyWith(
                                              color: const Color(0xff565353),
                                            ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                buildTitleWidget(context, "الفاتورة"),
                BillDetailsWidget(
                  item: e,
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget buildTitleWidget(BuildContext context, String text) {
    return Container(
      width: double.infinity,
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
