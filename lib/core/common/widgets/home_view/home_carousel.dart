import 'package:amimpact/core/common/stores/home_store/home_store.dart';
import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = locator<HomeStore>().model!;
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 32),
        child: CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: false,
              height: 100),
          items: (model.result?.slider ?? []).map((i) {
            return GestureDetector(
              onTap: () async {
                // if (await canLaunch(
                //   "https://amimpact1972.com/support-amim",
                // )) await launch("https://amimpact1972.com/support-amim");
              },
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    child: CachedImage(
                      fit: BoxFit.fitHeight,
                      url: i.sliderImg ?? "",
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
