import 'package:amimpact/core/common/views/empty_view/empty_view.dart';
import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/orders/widgets/cart/cart_icon_widget.dart';
import 'package:amimpact/core/products/models/products_model/products_model.dart';
import 'package:amimpact/core/products/models/wishlist_model/wishlist_model.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/r.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/utils/network_services/products_service.dart';
import 'package:amimpact/core/products/views/product_view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_overlay/loading_overlay.dart';

class WishesView extends StatefulWidget {
  const WishesView({Key? key}) : super(key: key);

  @override
  State<WishesView> createState() => _WishesViewState();
}

class _WishesViewState extends State<WishesView> {
  WishlistModel? model;
  bool loading = false;
  @override
  void initState() {
    getWishlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الأمنيات"),
          actions: const [CartIconWidget()],
        ),
        body: model == null
            ? const LoadingView()
            : model?.products.isEmpty ?? true
                ? EmptyView(
                    text: "لا يوجد لديك منتجات بقائمة الأمنيات",
                    image: R.assetsImagesNoWishes,
                  )
                : ListView.builder(
                    itemCount: model?.products.length ?? 0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    itemBuilder: (_, index) => buildItem(context, index),
                  ),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    WishlistModelData item = model!.products[index];
    return GestureDetector(
      onTap: () {
        locator<NavHelper>().push(ProductView(model: item.product));
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      removeFromWishlist(item.id);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(R.assetsImagesRemoveIcon),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: CachedImage(
                          url: "$kBaseImageUrl${item.product.getImage()}",
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
                                item.product.name ?? "",
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
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  item.product.getShortDesc() ?? "",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .kufi12RegularTextStyle
                                      .copyWith(
                                        color: const Color(0xff565353),
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${item.product.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .kufi20BoldTextStyle,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "ريال",
                                  style: Theme.of(context)
                                      .textTheme
                                      .kufi10RegularTextStyle
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff979797),
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            RawMaterialButton(
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () => addToCart(item.product.sku ?? ""),
              fillColor: Theme.of(context).primaryColor,
              child: const Text(
                "إضافة للسلة",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: kHacinFont,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getWishlist() async {
    model = await locator<ProductService>().wishList();
    setState(() {});
  }

  Future addToCart(String sku) async {
    setState(() {
      loading = true;
    });
    await locator<CartStore>().addItem(1, sku);
    setState(() {
      loading = false;
    });
  }

  Future removeFromWishlist(int id) async {
    setState(() {
      loading = true;
    });
    await locator<ProductService>().removeFromWishlist(id);
    await getWishlist();
    setState(() {
      loading = false;
    });
  }
}
