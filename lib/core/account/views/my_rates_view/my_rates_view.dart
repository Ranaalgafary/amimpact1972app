import 'package:amimpact/core/common/views/empty_view/empty_view.dart';
import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/core/orders/views/orders_view/orders_view.dart';
import 'package:amimpact/core/products/models/reviews_model/review_model.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class MyRatesView extends StatefulWidget {
  const MyRatesView({Key? key}) : super(key: key);

  @override
  State<MyRatesView> createState() => _MyRatesViewState();
}

class _MyRatesViewState extends State<MyRatesView> {
  List<ReviewModel>? reviews;
  @override
  void initState() {
    getReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("التقييمات"),
      ),
      body: reviews == null
          ? const LoadingView()
          : reviews?.isEmpty ?? true
              ? buildEmptyView(context)
              : ListView.builder(
                  itemCount: reviews?.length ?? 0,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  itemBuilder: (_, index) => buildItem(context, index),
                ),
    );
  }

  EmptyView buildEmptyView(BuildContext context) {
    return EmptyView(
      text: "لم تقم بإرسال أية تقييمات",
      image: R.assetsImagesNoRates,
      secondWidget: TextButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const OrdersView())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "قيم المنتجات التي قمت بشراءها",
              style: Theme.of(context)
                  .textTheme
                  .kufi14RegularTextStyle
                  .copyWith(color: Theme.of(context).primaryColorDark),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              Icons.warning,
              color: Theme.of(context).primaryColorDark,
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 70,
                  child: CachedImage(
                    url:
                        "https://amimpact.b-cdn.net/pub/media/mf_webp/png/media/catalog/product/cache/847acd8d0f811ce6d09a6821d7cba734/7/8/781027-1.webp",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "مجموعة رش اي ام امباكت مضخة",
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .kufi12RegularTextStyle
                              .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          children: [
                            Text(
                              "الرأي : ",
                              style: Theme.of(context)
                                  .textTheme
                                  .kufi14RegularTextStyle
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              reviews?[index].detail ?? "",
                              style: const TextStyle(
                                color: Color(0xff565353),
                                fontFamily: kBeinFont,
                                fontSize: 12,
                              ),
                            ),
                            const Spacer(),
                            IgnorePointer(
                              child: RatingBar.builder(
                                itemSize: 15,
                                initialRating: double.tryParse(
                                      reviews?[index].avgValue ?? "",
                                    ) ??
                                    0,
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
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future getReviews() async {
    reviews = await locator<AuthService>().getReviews();
    setState(() {});
  }
}
