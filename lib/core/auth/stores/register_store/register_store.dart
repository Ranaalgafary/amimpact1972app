// ignore_for_file: avoid_dynamic_calls

import 'package:amimpact/core/auth/models/login_model/login_model.dart';
import 'package:amimpact/core/auth/stores/auth_store/auth_store.dart';
import 'package:amimpact/core/auth/stores/login_store/login_store.dart';
import 'package:amimpact/core/common/views/start_view/start_view.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  bool loading = false;

  final GlobalKey<FormState> formKey = GlobalKey();

  @observable
  String firstName = "";
  @observable
  String lastName = "";
  @observable
  String email = "";
  @observable
  String phoneNumber = "";
  @observable
  String password = "";
  @observable
  String confirmPassword = "";

  @observable
  bool obsecureText = true;

  Future register() async {
    if (formKey.currentState!.validate()) {
      loading = true;
      final res = await locator<AuthService>().registerWithEmail(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phoneNumber: phoneNumber);
      if (res is bool && res) {
        await locator<AuthStore>().saveUserCred(email, password);
        await locator<AuthStore>().init();
        locator<NavHelper>().pushAndRemoveUntilFirst(const StartView());
      } else {
        locator<UiHelper>().showErrorMessage(
          res.toString(),
        );
      }
      loading = false;
    }
  }
}
