// ignore_for_file: avoid_dynamic_calls

import 'package:amimpact/core/auth/models/login_model/login_model.dart';
import 'package:amimpact/core/auth/stores/auth_store/auth_store.dart';
import 'package:amimpact/core/common/views/start_view/start_view.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  bool loading = false;

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future login() async {
    if (formKey.currentState!.validate()) {
      loading = true;
      final res = await locator<AuthService>().login(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );
      if (res is LoginModel) {
        locator<AuthStore>().onLogin(
          res,
          email: usernameController.text.trim(),
          password: passwordController.text.trim(),
        );
        locator<NavHelper>().pushAndRemoveUntilFirst(const StartView());
      } else {
        locator<UiHelper>().showErrorMessage(
          res.toString(),
        );
      }
      loading = false;
    }
  }

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
  }
}
