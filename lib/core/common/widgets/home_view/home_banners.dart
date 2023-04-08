import 'package:amimpact/core/common/models/home_model/banner.dart';
import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/products/views/products_view/products_view.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:flutter/material.dart';

class HomeBannersWidget extends StatefulWidget {
  const HomeBannersWidget({
    Key? key,
    required this.banners,
  }) : super(key: key);

  final List<HomeBanner> banners;

  @override
  State<HomeBannersWidget> createState() => _HomeBannersWidgetState();
}

class _HomeBannersWidgetState extends State<HomeBannersWidget> {
  late final List<HomeBanner> banners;
  Map<String, List<HomeBanner>> bannersMap = {};

  @override
  void initState() {
    banners = List.of(widget.banners);
    setBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return bannersMap.isEmpty
        ? const SizedBox.shrink()
        : ListView(
            padding: const EdgeInsets.only(top: 8),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: bannersMap.keys
                .map((
                  key,
                ) =>
                    buildBunnersWidget(key))
                .toList(),
          );
  }

  Widget buildBunner(HomeBanner banner) {
    return Expanded(
      child: GestureDetector(
        onTap: banner.path == null
            ? null
            : () => locator<NavHelper>().push(
                  ProductsView(
                    allowPagination: false,
                    path: banner.path,
                    title: banner.bannerName,
                  ),
                ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedImage(
              fit: BoxFit.fitHeight,
              url: banner.bannerImg,
            ),
          ),
        ),
      ),
    );
  }

  void setBanners() {
    print(banners);
    bannersMap = {};
    for (int i = 0; i < banners.length; i++) {
      print(i);
      final banner = banners[i];
      if (banner.size == kBigBannerSize) {
        bannersMap[banner.bannerPosition ?? ""] = [banner];
      } else if (banner.size == kMediumBannerSize) {
        bannersMap[banner.bannerPosition ?? ""] = [banner, banners[i + 1]];
        i = i + 1;
      } else if (banner.size == kSmallBannerSize) {
        bannersMap[banner.bannerPosition ?? ""] = [
          banner,
          banners[i + 1],
          banners[i + 2]
        ];
        i = i + 2;
      }
    }
  }

  Widget buildBunnersWidget(String key) {
    final list = bannersMap[key]!;
// bannersMap[key]!.map((e) => buildBunner(e)).toList()
    return Row(
      children: [
        buildBunner(list[0]),
        if (list.length > 1) ...[
          const SizedBox(
            width: 8,
          ),
          buildBunner(list[1]),
        ],
        if (list.length == 3) ...[
          const SizedBox(
            width: 8,
          ),
          buildBunner(list[2]),
        ],
      ],
    );
  }
}
