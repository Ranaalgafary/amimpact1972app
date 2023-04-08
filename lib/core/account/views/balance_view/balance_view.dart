import 'package:amimpact/core/account/models/balance_history_model/balance_history_model.dart';
import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class BalanceView extends StatefulWidget {
  const BalanceView({Key? key}) : super(key: key);

  @override
  State<BalanceView> createState() => _BalanceViewState();
}

class _BalanceViewState extends State<BalanceView> {
  int? balance;
  BalanceHistoryModel? historyModel;
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الرصيد"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: balance == null
            ? const LoadingView()
            : Column(
                children: [
                  buildBalanceWidget(context),
                  Expanded(
                    child: historyModel == null
                        ? const Center(
                            child: LoadingView(),
                          )
                        : ListView.builder(
                            itemCount: historyModel?.items?.length ?? 0,
                            itemBuilder: (_, index) {
                              final item = historyModel!.items![index];
                              return Card(
                                margin: const EdgeInsets.only(
                                    top: 8, left: 8, right: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          buildTitle(context, "رقم العملية"),
                                          buildValueText(
                                              context, "${item.historyId}")
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          buildTitle(context, "العملية"),
                                          buildValueText(
                                            context,
                                            "${int.tryParse("${item.isDeduct}") != 1 ? "+" : "-"}${num.tryParse(item.difference ?? "")} رس",
                                            color: int.tryParse(
                                                        "${item.isDeduct}") !=
                                                    1
                                                ? Colors.green
                                                : Colors.red,
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          buildTitle(context, "الرصيد الجديد"),
                                          buildValueText(context,
                                              "${num.tryParse(item.storeCreditBalance ?? "")} رس")
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          buildTitle(context, "الإجراء"),
                                          buildValueText(
                                              context,
                                              int.tryParse(
                                                          "${item.isDeduct}") !=
                                                      1
                                                  ? "إضافة رصيد"
                                                  : "خصم رصيد")
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          buildTitle(context, "التاريخ"),
                                          buildValueText(
                                              context, item.createdAt ?? "")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  )
                ],
              ),
      ),
    );
  }

  Row buildBalanceWidget(BuildContext context) {
    return Row(
      children: [
        Text(
          "الرصيد الحالي",
          style: Theme.of(context)
              .textTheme
              .kufi12BoldTextStyle
              .copyWith(color: Colors.black),
        ),
        const Spacer(),
        Text(
          "$balance",
          style: Theme.of(context).textTheme.kufi14RegularTextStyle.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4, left: 24),
          child: Text(
            "ر س",
            style: Theme.of(context).textTheme.kufi14RegularTextStyle.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ],
    );
  }

  Widget buildTitle(BuildContext context, String text) {
    return SizedBox(
      width: 120,
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
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }

  Widget buildValueText(BuildContext context, String text,
      {Color color = const Color(0xff565353)}) {
    return Text(
      text,
      style: TextStyle(color: color, fontFamily: kBeinFont, fontSize: 12),
    );
  }

  Future getBalance() async {
    balance = await locator<AuthService>().getBalance();
    setState(() {});
  }

  Future getBalanceHistory() async {
    historyModel = await locator<AuthService>().getBalanceHistory();
    setState(() {});
  }

  Future init() async {
    Future.wait([getBalance(), getBalanceHistory()]);
  }
}
