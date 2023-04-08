import 'package:amimpact/core/account/stores/user_store/user_store.dart';
import 'package:amimpact/core/auth/stores/login_store/login_store.dart';
import 'package:amimpact/core/auth/views/forgot_password_view/forgot_password_view.dart';
import 'package:amimpact/core/auth/views/register_view/register_view.dart';
import 'package:amimpact/core/common/widgets/general/app_primary_button.dart';
import 'package:amimpact/core/common/widgets/general/app_text_field.dart';
import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:queen_validators/queen_validators.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, this.showBackButton = false}) : super(key: key);

  final bool showBackButton;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final store = LoginStore();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return LoadingWidget(
          isLoading: store.loading,
          child: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 130,
                      horizontal: 50,
                    ),
                    child: Form(
                      key: store.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "مرحبا",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: kDroidKufiFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          AppTextField(
                            controller: store.usernameController,
                            formKey: store.formKey,
                            onChange: (val) {
                              locator<UserStore>().email = val;
                            },
                            validator: qValidator([
                              const IsEmail("البريد الإلكتروني غير صحيح"),
                              IsRequired("لا يجب ترك هذا الحقل فارغا"),
                            ]),
                            textInputType: TextInputType.emailAddress,
                            hint: "البريد الإلكتروني",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Observer(
                            builder: (_) => AppTextField(
                              controller: store.passwordController,
                              formKey: store.formKey,
                              obsecureText: locator<UserStore>().obsecureText,
                              showPassword: () {
                                locator<UserStore>().obsecureText =
                                    !locator<UserStore>().obsecureText;
                              },
                              isPassword: true,
                              textInputAction: TextInputAction.done,
                              onChange: (val) {
                                locator<UserStore>().password = val;
                              },
                              validator: qValidator([
                                IsRequired("لا يجب ترك هذا الحقل فارغا"),
                                MinLength(6, "كلمة المرور قصيرة"),
                              ]),
                              onSubmit: (_) => store.login,
                              hint: "كلمة المرور",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 32),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ForgotPasswordView(
                                    showBackButtonForLogin:
                                        widget.showBackButton,
                                  ),
                                ),
                              ),
                              child: Text(
                                "نسيت كلمة المرور ؟",
                                style: Theme.of(context)
                                    .textTheme
                                    .kufi10RegularTextStyle
                                    .copyWith(
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                              ),
                            ),
                          ),
                          AppPrimaryButton(
                            onPressed: store.login,
                            text: "تسجيل الدخول",
                            color: Colors.black,
                            textStyle: Theme.of(context)
                                .textTheme
                                .authenticationPrimaryButtonTextStyle,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: Text(
                              "سجل عن طريق",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .kufi12RegularTextStyle,
                            ),
                          ),
                          // const SocialMediaWidget(),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "لا تمتلك حسابا ؟",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .kufi14RegularTextStyle,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => RegisterView(
                                      showBackButton: widget.showBackButton,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    "إنشاء حساب",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: kTajawalFont,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (widget.showBackButton)
                  Container(
                    margin: const EdgeInsets.only(top: 42, right: 8),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.black,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
