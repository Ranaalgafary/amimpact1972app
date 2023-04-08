import 'package:amimpact/core/common/widgets/general/app_primary_button.dart';
import 'package:amimpact/core/common/widgets/general/app_text_field.dart';
import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:amimpact/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  bool obsecureText = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      isLoading: loading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "تغيير كلمة السر",
            style: Theme.of(context).textTheme.kufi16RegularTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 70),
                  //   child: Text(
                  //     "عند إدخال البريد البريد الإلكتروني الخاص بحسابك في الموقع ستصلك رسالة إعادة تعيين كلمة المرور",
                  //     style: TextStyle(fontFamily: kTajawalFont, fontSize: 14),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  AppTextField(
                    formKey: _formKey,
                    obsecureText: obsecureText,
                    showPassword: () {
                      obsecureText = !obsecureText;
                    },
                    isPassword: true,
                    onChange: (_) {},
                    controller: passwordController,
                    validator: qValidator([
                      IsRequired("لا يجب ترك هذا الحقل فارغا"),
                      MinLength(6, "كلمة المرور قصيرة"),
                    ]),
                    hint: "كلمة المرور الحالية",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextField(
                    formKey: _formKey,
                    obsecureText: obsecureText,
                    showPassword: () {
                      obsecureText = !obsecureText;
                    },
                    isPassword: true,
                    onChange: (_) {},
                    controller: newPasswordController,
                    validator: qValidator([
                      IsRequired("لا يجب ترك هذا الحقل فارغا"),
                      MinLength(6, "كلمة المرور قصيرة"),
                    ]),
                    hint: "كلمة المرور الجديدة",
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  AppPrimaryButton(
                    onPressed: () => changePassword(context),
                    text: "تغيير",
                    textStyle: Theme.of(context)
                        .textTheme
                        .authenticationPrimaryButtonTextStyle,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> changePassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      final res = await locator<AuthService>().changePassword(
        passwordController.text.trim(),
        newPasswordController.text.trim(),
      );
      setState(() {
        loading = false;
      });
      if (res is bool && res) {
        locator<Prefs>().setPassword(newPasswordController.text.trim());
        Navigator.pop(context);
      } else {
        locator<UiHelper>().showErrorMessage(res.toString());
      }
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();

    super.dispose();
  }
}
