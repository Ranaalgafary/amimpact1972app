import 'dart:io';

import 'package:amimpact/core/auth/views/login_view/login_view.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:amimpact/core/common/views/splash_view/splash_view.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/utils/prefs.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:flutter/material.dart';

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpoverrides();
  setupLocator();
  await locator<Prefs>().setSharedPrefs();
  await FCMConfig.instance.init(
    defaultAndroidChannel: const AndroidNotificationChannel(
      'amimpact_channel',
      'amimpact',
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('notification'),
    ),
  );

  FirebaseMessaging.instance.subscribeToTopic("amimpact");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavHelper>().navigatorKey,
      title: 'Im Impact',
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: Builder(
          builder: (BuildContext context) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: child!,
            );
          },
        ),
      ),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          toolbarTextStyle: const TextTheme(
            headline6: TextStyle(
              color: Color(0xff444444),
              fontFamily: kBeinFont,
              fontSize: 20,
            ),
          ).bodyText2,
          titleTextStyle: const TextTheme(
            headline6: TextStyle(
              color: Color(0xff444444),
              fontFamily: kBeinFont,
              fontSize: 20,
            ),
          ).headline6,
        ),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xffF3B135),
        primaryColorDark: const Color(0xffBE8C2F),
      ),
      routes: {
        "/": (_) => const SplashView(),
        "/login": (_) => const LoginView(),
      },
    );
  }
}
