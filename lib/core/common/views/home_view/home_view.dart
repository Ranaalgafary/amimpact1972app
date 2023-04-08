import 'package:amimpact/core/common/models/home_model/banner.dart';
import 'package:amimpact/core/common/models/home_model/home_model.dart';
import 'package:amimpact/core/common/stores/home_store/home_store.dart';
import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/core/common/widgets/home_view/category_section.dart';
import 'package:amimpact/core/common/widgets/home_view/home_carousel.dart';
import 'package:amimpact/core/common/widgets/start_view/search_text_field.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/orders/views/cart_view/cart_view.dart';
import 'package:amimpact/core/products/views/products_view/products_view.dart';
import 'package:amimpact/enums/products_types.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final model = locator<HomeStore>().model;

        return LoadingWidget(
          isLoading: locator<CartStore>().loading,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: locator<HomeStore>().model == null
                ? const LoadingView()
                : CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(
                        child: SearchTextField(),
                      ),
                      const HomeCarousel(),
                      if (locator<HomeStore>().model != null)
                        SliverToBoxAdapter(
                          child: Container(
                            margin: const EdgeInsets.only(top: 16, bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                buildOffersButton(
                                    image: "new_products",
                                    context: context,
                                    type: ProductsTypes.path,
                                    title: "الجديد",
                                    path: locator<HomeStore>()
                                            .model
                                            ?.result
                                            ?.newOffersSpecial?[1]
                                            .path ??
                                        ""),
                                buildOffersButton(
                                  image: "special_products",
                                  context: context,
                                  type: ProductsTypes.path,
                                  title: "المميز",
                                  path: locator<HomeStore>()
                                          .model
                                          ?.result
                                          ?.newOffersSpecial
                                          ?.last
                                          .path ??
                                      "",
                                ),
                                buildOffersButton(
                                  image: "offers",
                                  context: context,
                                  isOffers: true,
                                  type: ProductsTypes.path,
                                  title: "العروض",
                                  path: locator<HomeStore>()
                                          .model
                                          ?.result
                                          ?.newOffersSpecial
                                          ?.first
                                          .path ??
                                      "",
                                ),
                              ],
                            ),
                          ),
                        ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (_, index) => CategorySection(
                            section: model!.result!.sections![index],
                          ),
                          childCount: model?.result?.sections?.length ?? 0,
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget buildOffersButton({
    required String image,
    required BuildContext context,
    required ProductsTypes type,
    required String path,
    required String title,
    bool isOffers = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductsView(
              allowPagination: false,
              isOffers: isOffers,
              path: path,
              title: title,
            ),
          ),
        );
      },
      child: Image.asset(
        "assets/images/$image.png",
        fit: BoxFit.cover,
        width: Device.get().isTablet ? 150 : 70,
        height: Device.get().isTablet ? 150 : 70,
      ),
    );
  }
}
