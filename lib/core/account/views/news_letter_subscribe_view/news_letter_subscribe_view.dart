import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class NewsLetterSubscribeView extends StatefulWidget {
  const NewsLetterSubscribeView({Key? key}) : super(key: key);

  @override
  _NewsLetterSubscribeViewState createState() =>
      _NewsLetterSubscribeViewState();
}

class _NewsLetterSubscribeViewState extends State<NewsLetterSubscribeView> {
  bool _subscribe = true;
  bool loading = false;
  @override
  void initState() {
    _subscribe =
        locator<AccountStore>().user?.extensionAttributes?.isSubscribed ??
            false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إشتراكات القائمة البريدية"),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    value: _subscribe,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          _subscribe = value!;
                        },
                      );
                    },
                  ),
                  Text(
                    "اشتراك عام",
                    style: Theme.of(context).textTheme.kufi14RegularTextStyle,
                  )
                ],
              ),
              const Spacer(),
              RawMaterialButton(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: save,
                fillColor: Theme.of(context).primaryColor,
                child: const Text(
                  "حفظ",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: kHacinFont,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> save() async {
    setState(() {
      loading = true;
    });
    final res = await locator<AuthService>().updateProfile(
      firstName: locator<AccountStore>().user?.firstname ?? "",
      lastName: locator<AccountStore>().user?.lastname ?? "",
      subscribed: _subscribe,
    );
    if (res is bool && res) {
      locator<AccountStore>().user?.extensionAttributes?.isSubscribed =
          _subscribe;
      locator<NavHelper>().pop();
    } else {
      locator<UiHelper>().showErrorMessage(res.toString());
    }
    setState(() {
      loading = false;
    });
  }
}
