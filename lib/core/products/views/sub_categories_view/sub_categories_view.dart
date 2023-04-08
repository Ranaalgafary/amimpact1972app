import 'package:amimpact/core/common/widgets/start_view/search_text_field.dart';
import 'package:amimpact/core/orders/widgets/cart/cart_icon_widget.dart';
import 'package:amimpact/core/products/stores/categories_store/categories_store.dart';
import 'package:amimpact/core/products/views/products_view/products_view.dart';
import 'package:amimpact/core/products/widgets/product/filter_widget.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SubCategoriesView extends StatefulWidget {
  const SubCategoriesView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SubCategoriesView> createState() => _SubCategoriesViewState();
}

class _SubCategoriesViewState extends State<SubCategoriesView> {
  final store = locator<CategoriesStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final path = store.productsPath;
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (_, __) => [
              SliverAppBar(
                pinned: true,
                elevation: 2,
                title: Text(widget.title),
                actions: const [CartIconWidget()],
              ),
              Observer(
                builder: (context) {
                  return SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(child: SearchTextField()),
                              FilterWidget(
                                filters: store.filters,
                                onFilter: () => setState(() {}),
                              )
                            ],
                          ),
                          if (store.subCategoriesModel?.result != null &&
                              store.subCategoriesModel!.result!.isNotEmpty) ...[
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: buildSubCategoryList(context),
                            ),
                          ],
                          if (store.subSubCategoriesModel?.result != null &&
                              store.subSubCategoriesModel!.result!
                                  .isNotEmpty) ...[
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 16, top: 12, bottom: 12,),
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: buildSubSubCategoryList(context),
                            ),
                          ]
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
            body: ProductsView(
              allowPagination: true,
              key: UniqueKey(),
              showAppBar: false,
              path: path,
              filters: store.hasFilters() ? store.filters : null,
            ),
          ),
        );
      },
    );
  }

  SizedBox buildSubCategoryList(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: store.subCategoriesModel?.result?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final cat = store.subCategoriesModel!.result![index];
          return Observer(
            builder: (_) {
              return buildSubCategoryWidget(
                context,
                text: cat.name ?? "",
                isActive: cat.categoryId == store.selectedSubCategoryId,
                onPressed: () {
                  store.selectSubCategory(cat, index);
                },
              );
            },
          );
        },
      ),
    );
  }

  SizedBox buildSubSubCategoryList(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Observer(
        builder: (_) => ListView.builder(
          itemCount: store.subSubCategoriesModel?.result?.length ?? 0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Observer(
            builder: (_) {
              final cat = store.subSubCategoriesModel!.result![index];

              return buildSubCategoryWidget(
                context,
                text: cat.name ?? "",
                isActive: cat.categoryId == store.selectedSubSubCategoryId,
                onPressed: () {
                  store.selectSubSubCategory(cat);
                },
                isSubCategory: false,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildSubCategoryWidget(
    BuildContext context, {
    required String text,
    required bool isActive,
    required VoidCallback onPressed,
    bool isSubCategory = true,
  }) {
    final activeColor = isSubCategory
        ? Theme.of(context).primaryColor
        : Theme.of(context).primaryColorDark;
    final inActiveColor = isSubCategory
        ? const Color(0xffD9D9D9)
        : const Color(0xffD9D9D9).withOpacity(.34);

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        margin: const EdgeInsets.only(left: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: isActive ? activeColor : inActiveColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: kBeinFont,
              fontSize: 12,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }
}
