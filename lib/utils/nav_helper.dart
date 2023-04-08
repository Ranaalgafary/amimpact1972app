import 'package:flutter/material.dart';

class NavHelper {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future push(Widget view) async {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (_) => view));
  }

  Future pushNamed(String name) async {
    return navigatorKey.currentState!.pushNamed(name);
  }

  Future pushAndRemoveUntilFirst(Widget view) async {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => view),
      (route) => false,
    );
  }

  Future pushReplacement(Widget view) async {
    return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (_) => view),
    );
  }

  Future pushAndRemoveUntilFirstNamed(String name) async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      name,
      (route) => false,
    );
  }

  void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState!.pop(result);
  }

  void popUntilNamed(String name) {
    navigatorKey.currentState!.popUntil((route) => route.settings.name == name);
  }

  void popUntilFirst() {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  bool isRTL(BuildContext context) =>
      Directionality.of(context) == TextDirection.rtl;
}
