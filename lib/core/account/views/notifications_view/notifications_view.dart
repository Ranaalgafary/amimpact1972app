import 'package:amimpact/core/account/models/notifications_model/notifications_model.dart';
import 'package:amimpact/core/account/models/notifications_model/result.dart';
import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  NotificationsModel? model;
  @override
  void initState() {
    getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الإشعارات",
        ),
      ),
      body: model == null
          ? const LoadingView()
          : model?.result?.isEmpty ?? true
              ? const Center(
                  child: Text("لا يوجد أي إشعارات"),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  itemCount: model?.result?.length ?? 0,
                  itemBuilder: (_, index) {
                    return buildItem(model!.result![index]);
                  },
                ),
    );
  }

  Widget buildItem(Result notification) {
    return Card(
      color: const Color(0xffF7F7F7),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.message ?? "",
              style: Theme.of(context).textTheme.kufi12RegularTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    DateFormat("dd-MM-y  ")
                        .add_jm()
                        .format(DateTime.parse(notification.date!)),
                    style: Theme.of(context).textTheme.kufi10RegularTextStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future getNotifications() async {
    model = await locator<AuthService>().getNotifications();
    if (mounted) setState(() {});
  }
}
