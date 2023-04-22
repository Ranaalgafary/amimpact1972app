import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'user_informations_store.g.dart';

class UserInformationsStore = UserInformationsStoreBase
    with _$UserInformationsStore;

abstract class UserInformationsStoreBase with Store {
  final TextEditingController firstNameControler =
      TextEditingController(text: locator<AccountStore>().user?.firstname);
  final TextEditingController lastNameController =
      TextEditingController(text: locator<AccountStore>().user?.lastname);
  final TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  bool loading = false;

  Future<void> save() async {
    if (formKey.currentState!.validate()) {
      loading = true;
      final res = await locator<AuthService>().updateProfile(
        firstName: firstNameControler.text.trim(),
        lastName: lastNameController.text.trim(),
        subscribed:
            locator<AccountStore>().user?.extensionAttributes?.isSubscribed ??
                false,
      );
      if (res is bool && res) {
        locator<NavHelper>().pop();
        locator<AccountStore>().user?.firstname =
            firstNameControler.text.trim();
        locator<AccountStore>().user?.lastname = lastNameController.text.trim();
      } else {
        locator<UiHelper>().showErrorMessage(res.toString());
      }
      loading = false;
    }
  }

  void dispose() {
    firstNameControler.dispose();
    lastNameController.dispose();
    phoneController.dispose();
  }

  Future deleteAccount(BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text(
                "تحذير",
                style:
                    const TextStyle(fontFamily: kHacinFont, color: Colors.red),
              ),
              content: const Text(
                "هل أنت متأكد من حذف الحساب؟",
                style: TextStyle(fontFamily: kHacinFont),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "لا",
                    style:
                        TextStyle(fontFamily: kHacinFont, color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    delete();
                  },
                  child: const Text(
                    "نعم",
                    style: TextStyle(fontFamily: kHacinFont, color: Colors.red),
                  ),
                ),
              ],
            ));
  }

  Future delete() async {
    loading = true;
    final res = await locator<AuthService>().deleteAccount();
    if (res is bool && res) {
      locator<NavHelper>().pop();
      locator<AccountStore>().logout();
    } else {
      locator<UiHelper>().showErrorMessage(res.toString());
    }
    loading = false;
  }
}
