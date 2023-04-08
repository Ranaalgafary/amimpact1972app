import 'dart:io';

import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/account/stores/user_information_store/user_informations_store.dart';
import 'package:amimpact/core/common/widgets/general/app_text_field.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:queen_validators/queen_validators.dart';

class UserInformationsView extends StatefulWidget {
  const UserInformationsView({Key? key}) : super(key: key);

  @override
  _UserInformationsViewState createState() => _UserInformationsViewState();
}

class _UserInformationsViewState extends State<UserInformationsView> {
  final UserInformationsStore _store = UserInformationsStore();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => LoadingOverlay(
        isLoading: _store.loading,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("الملف الشخصي"),
          ),
          body: Form(
            key: _formKey,
            child: SafeArea(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: _store.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Align(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 32),
                        width: 170,
                        height: 170,
                        child: ClipOval(
                          child: Image.asset(R.assetsImagesAvatar),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Observer(
                      builder: (_) => AppTextField(
                        formKey: _formKey,
                        enabled: !_store.loading,
                        onChange: (value) {},
                        hint: "الإسم الأول",
                        validator: qValidator([
                          IsRequired("لا يجب ترك هذا الحقل فارغا"),
                        ]),
                        controller: _store.firstNameControler,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(
                      builder: (_) => AppTextField(
                        formKey: _formKey,
                        enabled: !_store.loading,
                        onChange: (value) {},
                        hint: "الإسم الأخير",
                        validator: qValidator([
                          IsRequired("لا يجب ترك هذا الحقل فارغا"),
                        ]),
                        controller: _store.lastNameController,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(
                      builder: (_) => AppTextField(
                        formKey: _formKey,
                        enabled: false,
                        onChange: (value) {},
                        validator: qValidator([
                          IsRequired("لا يجب ترك هذا الحقل فارغا"),
                        ]),
                        hint: "الإيميل",
                        initialValue: locator<AccountStore>().user?.email,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(
                      builder: (_) => AppTextField(
                        enabled: !_store.loading,
                        formKey: _formKey,
                        textInputAction: TextInputAction.done,
                        textInputType: const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChange: (val) {},
                        controller: _store.phoneController,
                        validator: qValidator([
                          IsRequired("لا يجب ترك هذا الحقل فارغا"),
                          MinLength(7, "رقم الهاتف غير صحيح"),
                        ]),
                        suffexIcon: Image.asset(R.assetsImagesSaudiFlag),
                        onSubmit: (_) {},
                        hint: "رقم الجوال",
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Observer(
                      builder: (_) => RawMaterialButton(
                        constraints: const BoxConstraints(
                          minWidth: double.infinity,
                          minHeight: 50,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: _store.save,
                        fillColor: Colors.green,
                        child: const Text(
                          "حفظ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: kHacinFont,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    if (Platform.isIOS)
                      TextButton(
                          onPressed: () {
                            _store.deleteAccount(context);
                          },
                          child: const Text(
                            "حذف الحساب",
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: kHacinFont,
                            ),
                          ),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
