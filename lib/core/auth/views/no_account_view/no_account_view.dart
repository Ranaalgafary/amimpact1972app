import 'package:amimpact/core/auth//views/login_view/login_view.dart';
import 'package:amimpact/core/auth//views/register_view/register_view.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';

class NoAccountView extends StatelessWidget {
  const NoAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(R.assetsImagesNoAccount),
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                "لاتمتلك حساباً , يمكنك",
                style: TextStyle(
                  fontFamily: kBeinFont,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginView(
                      showBackButton: true,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontFamily: kBeinFont,
                    fontSize: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                "أو",
                style: TextStyle(
                  fontFamily: kBeinFont,
                  fontSize: 22,
                  height: .8,
                  color: Color(0xff707070),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RegisterView(
                      showBackButton: true,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "إنشاء حساب",
                  style: TextStyle(
                    fontFamily: kBeinFont,
                    fontSize: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
