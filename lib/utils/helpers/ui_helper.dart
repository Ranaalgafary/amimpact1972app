import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:flutter/material.dart';

class UiHelper {
  void showErrorMessage(String text) {
    ScaffoldMessenger.of(locator<NavHelper>().navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    ));
  }
}
