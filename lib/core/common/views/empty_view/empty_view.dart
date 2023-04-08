import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView(
      {Key? key, required this.text, required this.image, this.secondWidget})
      : super(key: key);
  final String text;
  final String image;
  final Widget? secondWidget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.kufi14RegularTextStyle,
          ),
          if (secondWidget != null) ...[
            const SizedBox(
              height: 16,
            ),
            secondWidget!
          ],
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
