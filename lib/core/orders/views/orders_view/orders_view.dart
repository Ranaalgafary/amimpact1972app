import 'package:amimpact/core/common/views/empty_view/empty_view.dart';
import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/core/orders/models/my_orders_model/my_orders_model.dart';
import 'package:amimpact/core/orders/models/my_orders_model/order.dart';
import 'package:amimpact/core/orders/views/order_details_view/order_details_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/orders_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  final isEmpty = false;

  MyOrdersModel? myOrders;
  bool loading = true;
  @override
  void initState() {
    getMyOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الطلبات"),
      ),
      body: loading
          ? const LoadingView()
          : myOrders?.orders?.isEmpty ?? false
              ? EmptyView(
                  text: "لا يوجد أي طلبات",
                  image: R.assetsImagesNoOrders,
                )
              : ListView.builder(
                  itemCount: myOrders?.orders?.length ?? 0,
                  itemBuilder: (_, index) =>
                      buildItem(context, myOrders!.orders![index]),
                ),
    );
  }

  Widget buildItem(BuildContext context, Order order) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => OrderDetailsView(
            order: order,
          ),
        ),
      ),
      child: Card(
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: Text(
                    //     order.orderItems?.first.name ?? "",
                    //     maxLines: 1,
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .kufi12RegularTextStyle
                    //         .copyWith(
                    //           color: Colors.black,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: Text(
                    //     "طلب : ${order.}",
                    //     maxLines: 1,
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .kufi12RegularTextStyle
                    //         .copyWith(
                    //           color: const Color(0xff565353),
                    //         ),
                    //   ),
                    // ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "رقم الطلب : ${order.quoteId}",
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

                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "التاريخ : ${DateFormat("d/MM/yyyy").format(DateTime.parse(order.createdAt ?? ""))}",
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
                      child: Text(
                        "الإجمالي : ${order.grandTotal} ر.س",
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
                      child: Text(
                        "الحالة : ${order.getStatus()}",
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .kufi12RegularTextStyle
                            .copyWith(
                              color: const Color(0xff565353),
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future getMyOrders() async {
    myOrders = await locator<OrdersService>().getMyOrders();
    myOrders?.orders
        ?.sort((b, a) => (a.quoteId ?? 0).compareTo(b.quoteId ?? 0));
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }
}
