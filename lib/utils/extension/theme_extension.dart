import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';

extension TextThemeExtension on TextTheme {
  TextStyle get textFieldTextStyle => const TextStyle(
        color: Color(0xff808080),
        fontSize: 14,
        fontFamily: kDroidKufiFont,
      );

  TextStyle get primaryButtonTextStyle => const TextStyle(
        color: Color(0xff808080),
        fontSize: 14,
        fontFamily: kDroidKufiFont,
      );
  TextStyle get authenticationPrimaryButtonTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontFamily: kDroidKufiFont,
      );

  TextStyle get kufi10RegularTextStyle => const TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontFamily: kDroidKufiFont,
      );
  TextStyle get kufi12RegularTextStyle => const TextStyle(
        color: Color(0xff565353),
        fontSize: 12,
        fontFamily: kDroidKufiFont,
      );

  TextStyle get kufi12BoldTextStyle => const TextStyle(
        color: Color(0xff565353),
        fontSize: 12,
        fontFamily: kDroidKufiFont,
        fontWeight: FontWeight.bold,
      );
  TextStyle get kufi14RegularTextStyle => const TextStyle(
        color: Color(0xff565353),
        fontSize: 14,
        fontFamily: kDroidKufiFont,
      );
  TextStyle get kufi16RegularTextStyle => const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: kDroidKufiFont,
      );

  TextStyle get kufi20BoldTextStyle => const TextStyle(
        color: Color(0xffBE8C2F),
        fontSize: 20,
        fontFamily: kDroidKufiFont,
        fontWeight: FontWeight.bold,
      );
}

extension ThemeExtension on ThemeData {
  Color get greenColor => const Color(0xff01AC51);
  Color get redColor => const Color(0xffFF0000);
  Color get iconColor => const Color(0xff808080);
}
