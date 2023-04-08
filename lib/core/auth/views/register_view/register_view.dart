import 'package:amimpact/core/auth/stores/register_store/register_store.dart';
import 'package:amimpact/core/common/widgets/general/app_primary_button.dart';
import 'package:amimpact/core/common/widgets/general/app_text_field.dart';
import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:queen_validators/queen_validators.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key, this.showBackButton = false}) : super(key: key);
  final bool showBackButton;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final store = RegisterStore();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => LoadingWidget(
        isLoading: store.loading,
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 130, horizontal: 50),
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
                          height: 18,
                        ),
                        AppTextField(
                          formKey: store.formKey,
                          onChange: (val) {
                            store.firstName = val;
                          },
                          validator: qValidator([
                            IsRequired("لا يجب ترك هذا الحقل فارغا"),
                          ]),
                          hint: "الإسم الأول",
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        AppTextField(
                          formKey: store.formKey,
                          onChange: (val) {
                            store.lastName = val;
                          },
                          validator: qValidator([
                            IsRequired("لا يجب ترك هذا الحقل فارغا"),
                          ]),
                          hint: "الإسم الأخير",
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        AppTextField(
                          initialValue: store.email,
                          formKey: store.formKey,
                          onChange: (val) {
                            store.email = val;
                          },
                          validator: qValidator([
                            const IsEmail("البريد الإلكتروني غير صحيح"),
                            IsRequired("لا يجب ترك هذا الحقل فارغا"),
                          ]),
                          textInputType: TextInputType.emailAddress,
                          hint: "البريد الإلكتروني",
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Observer(
                          builder: (_) => AppTextField(
                            formKey: store.formKey,
                            obsecureText: store.obsecureText,
                            showPassword: () {
                              store.obsecureText = !store.obsecureText;
                            },
                            isPassword: true,
                            onChange: (val) {
                              store.password = val;
                            },
                            validator: qValidator([
                              IsRequired("لا يجب ترك هذا الحقل فارغا"),
                              MinLength(6, "كلمة المرور قصيرة"),
                            ]),
                            hint: "كلمة المرور",
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Observer(
                          builder: (_) => AppTextField(
                            formKey: store.formKey,
                            obsecureText: store.obsecureText,
                            showPassword: () {
                              store.obsecureText = !store.obsecureText;
                            },
                            isPassword: true,
                            onChange: (val) {
                              store.confirmPassword = val;
                            },
                            validator: qValidator(
                              [
                                IsRequired("لا يجب ترك هذا الحقل فارغا"),
                                MinLength(6, "كلمة المرور قصيرة"),
                                // Match(store.password,
                                //     "يجب أن تتطابق مع كلمة المرور")
                              ],
                            ),
                            hint: "تأكيد كلمة المرور",
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        AppTextField(
                          formKey: store.formKey,
                          textInputAction: TextInputAction.done,
                          textInputType: const TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          ),
                          onChange: (val) {
                            store.phoneNumber = val;
                          },
                          validator: qValidator([
                            IsRequired("لا يجب ترك هذا الحقل فارغا"),
                            MinLength(7, "رقم الهاتف غير صحيح"),
                          ]),
                          suffexIcon: Image.asset(R.assetsImagesSaudiFlag),
                          onSubmit: (_) => register(),
                          hint: "رقم الجوال",
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        AppPrimaryButton(
                          onPressed: register,
                          text: "إنشاء حساب",
                          color: Colors.black,
                          textStyle: Theme.of(context)
                              .textTheme
                              .authenticationPrimaryButtonTextStyle,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
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
                              "تملك حسابا ؟",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .kufi14RegularTextStyle,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacementNamed(
                                context,
                                "/login",
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "تسجيل دخول",
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
      ),
    );
  }

  Future<void> register() async {
    if (store.formKey.currentState!.validate()) {
      store.register();
    }
  }
}
