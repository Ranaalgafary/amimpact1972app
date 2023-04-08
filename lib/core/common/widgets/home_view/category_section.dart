import 'package:amimpact/core/common/models/home_model/section.dart';
import 'package:amimpact/core/common/stores/home_store/home_store.dart';
import 'package:amimpact/core/common/widgets/home_view/home_banners.dart';
import 'package:amimpact/core/products/views/products_view/products_view.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/core/products/widgets/product/single_product.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key, required this.section}) : super(key: key);
  final Section section;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeBannersWidget(
          banners: (locator<HomeStore>().model?.result?.banners ?? [])
              .where((element) => element.sectionId == section.sectionId)
              .toList(),
        ),
        Row(
          children: [
            Text(
              section.sectionName ?? "",
              style: Theme.of(context)
                  .textTheme
                  .kufi14RegularTextStyle
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Spacer(),
            TextButton(
              onPressed: section.path == null
                  ? null
                  : () => locator<NavHelper>().push(
                        ProductsView(
                          allowPagination: false,
                          path: section.path,
                          title: section.sectionName,
                        ),
                      ),
              child: Text(
                "عرض الكل",
                style:
                    Theme.of(context).textTheme.kufi10RegularTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff979797),
                        ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 350,
          child: ListView.builder(
            itemCount: section.products?.items?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) =>
                SingleProductWidget(product: section.products!.items![index]),
          ),
        )
        // SizedBox(
        //   height: 350,
        //   child: StaggeredGridView.countBuilder(
        //     physics: const NeverScrollableScrollPhysics(),
        //     crossAxisCount: 4,
        //     itemCount: 2,
        //     itemBuilder: (BuildContext context, int index) =>
        //         const SingleProductWidget(),
        //     staggeredTileBuilder: (int index) =>
        //         const StaggeredTile.count(2, 3.5),
        //   ),
        // )
      ],
    );
  }
}
