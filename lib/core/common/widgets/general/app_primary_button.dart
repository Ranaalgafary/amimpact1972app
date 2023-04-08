import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    Key? key,
    required this.onPressed,
    this.color,
    required this.text,
    this.textStyle,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Color? color;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: color ?? Theme.of(context).primaryColor,
        child: Text(
          text,
          style:
              textStyle ?? Theme.of(context).textTheme.primaryButtonTextStyle,
        ),
      ),
    );
  }
}
