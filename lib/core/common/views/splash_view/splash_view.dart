import 'package:amimpact/core/common/stores/init_store/init_store.dart';
import 'package:amimpact/core/common/views/start_view/start_view.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await locator<InitStore>().init();
      locator<NavHelper>().pushAndRemoveUntilFirst(const StartView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(R.assetsImagesSplash),
      ),
    );
  }
}
