import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/r.dart';
import 'package:flutter/material.dart';

class NoProductsView extends StatelessWidget {
  const NoProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(R.assetsImagesNoProducts),
          const SizedBox(
            height: 16,
          ),
          Text(
            "لم يتم العثور على نتائج",
            style: Theme.of(context)
                .textTheme
                .kufi14RegularTextStyle
                .copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
