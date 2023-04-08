import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/views/no_account_view/no_account_view.dart';
import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/products/models/products_model/products_model_data.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/core/products/views/product_view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SingleProductWidget extends StatefulWidget {
  const SingleProductWidget(
      {Key? key, required this.product, this.isOffer = false})
      : super(key: key);
  final ProductsModelData product;
  final bool isOffer;
  @override
  _SingleProductWidgetState createState() => _SingleProductWidgetState();
}

class _SingleProductWidgetState extends State<SingleProductWidget> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 190,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductView(
              model: widget.product,
            ),
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff707070), width: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(top: 30),
                      height: 140,
                      child: CachedImage(
                        fit: BoxFit.contain,
                        url: "$kBaseImageUrl${widget.product.getImage()}",
                      ),
                    ),
                    Container(
                      height: .15,
                      color: const Color(0xff707070),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "${widget.product.name ?? ""}\n",
                          style: Theme.of(context)
                              .textTheme
                              .kufi12RegularTextStyle
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 6),
                    //   child: AutoSizeText(
                    //     widget.product.getShortDesc() ?? "",
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .kufi10RegularTextStyle
                    //         .copyWith(
                    //           color: const Color(0xff565353),
                    //         ),
                    //     maxLines: 1,
                    //     minFontSize: 10,
                    //   ),
                    // ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 46,
                        vertical: 10,
                      ),
                      height: .15,
                      color: const Color(0xff707070),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Text(
                            double.parse(
                                    "${widget.product.getDiscountPrice() ?? widget.product.price ?? "0"}")
                                .toStringAsFixed(2),
                            style:
                                Theme.of(context).textTheme.kufi12BoldTextStyle,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "ريال",
                            style: Theme.of(context)
                                .textTheme
                                .kufi12BoldTextStyle
                                .copyWith(
                                  color: const Color(0xff979797),
                                  fontSize: 8,
                                ),
                          ),
                          const Spacer(),
                          IgnorePointer(
                            child: RatingBar.builder(
                              itemSize: 15,
                              initialRating: widget.product.getRate(),
                              allowHalfRating: true,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: OutlinedButton(
                        onPressed: () {
                          if (locator<AccountStore>().isLoggedIn()) {
                            locator<CartStore>()
                                .addItem(1, widget.product.sku!);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const NoAccountView()));
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "أضف إلي السلة",
                              style: TextStyle(
                                fontFamily: kBeinFont,
                                fontSize: 12,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                buildFavoriteWidget(),
                if (widget.isOffer) buildDiscountLabel()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align buildFavoriteWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_outline),
        color: isFavourite ? Colors.redAccent : Theme.of(context).iconColor,
        onPressed: () {
          setState(() {
            isFavourite = !isFavourite;
          });
        },
      ),
    );
  }

  Widget buildDiscountLabel() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 8,
            ),
            Icon(
              widget.product.getDiscountPrice() != null
                  ? Icons.discount
                  : Icons.local_shipping,
              color: Colors.white,
              size: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                  widget.product.getDiscountPrice() != null
                      ? "عرض خاص"
                      : "شحن مجاني",
                  style: Theme.of(context)
                      .textTheme
                      .kufi10RegularTextStyle
                      .copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
