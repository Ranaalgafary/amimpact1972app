import 'package:amimpact/core/common/widgets/general/app_text_field.dart';
import 'package:amimpact/core/orders/stores/checkout_store/checkout_store.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key, required this.store}) : super(key: key);
  final CheckoutStore store;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: store.formKey,
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "المعلومات الشخصية",
              style: TextStyle(fontFamily: kBeinFont, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextField(
            enabled: false,
            onChange: (value) {},
            hint: "الإسم الأول",
            controller: store.firstNameController,
            formKey: store.formKey,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextField(
            controller: store.lastNameController,
            enabled: false,
            onChange: (value) {},
            hint: "الإسم الأخير",
            formKey: store.formKey,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextField(
            controller: store.emailController,
            enabled: false,
            formKey: store.formKey,
            onChange: (val) {},
            validator: qValidator([
              const IsEmail("البريد الإلكتروني غير صحيح"),
              IsRequired("لا يجب ترك هذا الحقل فارغا"),
            ]),
            textInputType: TextInputType.emailAddress,
            hint: "البريد الإلكتروني",
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextField(
            enabled: false,
            controller: store.phoneController,
            formKey: store.formKey,
            textInputAction: TextInputAction.done,
            textInputType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            onChange: (val) {},
            validator: qValidator([
              IsRequired("لا يجب ترك هذا الحقل فارغا"),
              MinLength(7, "رقم الهاتف غير صحيح"),
            ]),
            suffexIcon: Image.asset(R.assetsImagesSaudiFlag),
            hint: "رقم الجوال",
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
