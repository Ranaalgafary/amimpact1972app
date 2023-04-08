import 'package:amimpact/core/products/stores/product_store/product_store.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key, required this.store}) : super(key: key);
  final ProductStore store;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          double.parse(
            "${store.model.getDiscountPrice() ?? store.model.price ?? 0}",
          ).toStringAsFixed(2),
          style: Theme.of(context).textTheme.kufi20BoldTextStyle,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "ريال",
          style: Theme.of(context).textTheme.kufi10RegularTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xff979797),
              ),
        ),
        const Spacer(),
        IgnorePointer(
          child: RatingBar.builder(
            itemSize: 15,
            initialRating: store.model.getRate(),
            allowHalfRating: true,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
        )
      ],
    );
  }
}
