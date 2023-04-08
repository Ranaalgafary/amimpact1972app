import 'package:amimpact/core/auth/views/login_view/login_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/r.dart';
import 'package:flutter/material.dart';

class EmailSentView extends StatelessWidget {
  const EmailSentView({Key? key, this.showBackButtonForLogin = false})
      : super(key: key);
  final bool showBackButtonForLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                        // MaterialPageRoute(
                        //   builder: (_) => LoginView(
                        //     showBackButton: showBackButtonForLogin,
                        //   ),
                        // ),
                        );
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(R.assetsImagesEmailSent),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "تم الإرسال إلي بريدك الإلكتروني",
                    style: Theme.of(context).textTheme.kufi12RegularTextStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
