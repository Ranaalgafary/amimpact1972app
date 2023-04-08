import 'package:amimpact/core/common/widgets/general/cached_image.dart';
import 'package:amimpact/core/products/stores/product_store/product_store.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, required this.productStore}) : super(key: key);
  final ProductStore productStore;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            SizedBox(
              height: 250,
              child: CachedImage(
                url:
                    "$kBaseImageUrl${productStore.model.slider[productStore.currentIndex].image}",
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: productStore.model.slider.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () => productStore.currentIndex = index,
                  child: Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      border: index == productStore.currentIndex
                          ? Border.all(
                              color: Theme.of(context).primaryColor,
                            )
                          : null,
                    ),
                    child: CachedImage(
                      fit: BoxFit.contain,
                      url:
                          "$kBaseImageUrl${productStore.model.slider[index].image}",
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
