// ignore_for_file: use_build_context_synchronously

import 'package:amimpact/core/auth/views/forgot_password_view/email_sent_view.dart';
import 'package:amimpact/core/common/widgets/general/app_primary_button.dart';
import 'package:amimpact/core/common/widgets/general/app_text_field.dart';
import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';

class ForgotPasswordView extends StatefulWidget {
  final bool showBackButtonForLogin;

  const ForgotPasswordView({Key? key, this.showBackButtonForLogin = false})
      : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController controller = TextEditingController();
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
            "نسيت كلمة المرور",
            style: Theme.of(context).textTheme.kufi16RegularTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 70),
                    child: Text(
                      "عند إدخال البريد البريد الإلكتروني الخاص بحسابك في الموقع ستصلك رسالة إعادة تعيين كلمة المرور",
                      style: TextStyle(fontFamily: kTajawalFont, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AppTextField(
                    formKey: _formKey,
                    controller: controller,
                    onChange: (val) {},
                    validator: qValidator([
                      const IsEmail("البريد الإلكتروني غير صحيح"),
                      IsRequired("لا يجب ترك هذا الحقل فارغا"),
                    ]),
                    onSubmit: (_) => forgotPassword(context),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                    hint: "البريد الإلكتروني",
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  AppPrimaryButton(
                    onPressed: () => forgotPassword(context),
                    text: "التالي",
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

  Future<void> forgotPassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      final res =
          await locator<AuthService>().forgotPassword(controller.text.trim());
      setState(() {
        loading = false;
      });
      if (res is bool && res) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => EmailSentView(
              showBackButtonForLogin: widget.showBackButtonForLogin,
            ),
          ),
        );
      } else {
        locator<UiHelper>().showErrorMessage(res.toString());
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
