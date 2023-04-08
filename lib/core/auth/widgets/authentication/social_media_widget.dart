import 'dart:io';

import 'package:amimpact/core/account/stores/user_store/user_store.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => locator<UserStore>().loginWithGoogle(),
          child: SvgPicture.asset(R.assetsImagesGoogle),
        ),
        // const SizedBox(
        //   width: 32,
        // ),
        // SvgPicture.asset(R.assetsImagesFacebook),
        if (Platform.isIOS) ...[
          const SizedBox(
            width: 32,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              FontAwesomeIcons.apple,
              color: Colors.white,
            ),
          )
        ]
      ],
    );
  }
}
