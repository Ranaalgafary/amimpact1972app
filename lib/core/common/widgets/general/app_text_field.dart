import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.onChange,
    this.onSubmit,
    required this.hint,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.showPassword,
    this.enabled = true,
    this.obsecureText = false,
    this.suffexIcon,
    this.validator,
    this.formKey,
    this.controller,
    this.inputFormatters,
    this.initialValue,
  }) : super(key: key);
  final Function(String) onChange;
  final Function(String)? onSubmit;
  final String hint;
  final Widget? suffexIcon;
  final bool isPassword;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function? showPassword;
  final bool obsecureText;
  final FormFieldValidator<String>? validator;
  final GlobalKey<FormState>? formKey;
  final String? initialValue;
  final bool enabled;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      controller: controller,
      initialValue: initialValue,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      obscureText: obsecureText,
      onChanged: (_) {
        onChange(_);
        formKey?.currentState?.validate();
      },
      enabled: enabled,
      onFieldSubmitted: onSubmit,
      validator: validator,
      style: Theme.of(context).textTheme.textFieldTextStyle,
      decoration: InputDecoration(
        errorStyle:
            const TextStyle(color: Colors.red, fontFamily: kDroidKufiFont),
        border: InputBorder.none,
        filled: true,
        hintText: hint,
        fillColor: const Color(0xffF5F5F5),
        suffixIcon: isPassword ? passwordEye : suffexIcon,
      ),
    );
  }

  Widget get passwordEye => GestureDetector(
        onTap: () => showPassword!(),
        child: Icon(obsecureText ? Icons.visibility : Icons.visibility_off),
      );
}
