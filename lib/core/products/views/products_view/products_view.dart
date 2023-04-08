import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/orders/widgets/cart/cart_icon_widget.dart';
import 'package:amimpact/core/products/stores/products_store/products_store.dart';
import 'package:amimpact/core/products/views/no_products_view/no_products_view.dart';
import 'package:amimpact/core/products/widgets/product/single_product.dart';
import 'package:amimpact/enums/products_types.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({
    Key? key,
    this.path,
    this.filters,
    this.searchText,
    this.showAppBar = true,
    this.productsType = ProductsTypes.path,
    this.title,
    required this.allowPagination,
    this.isOffers = false,
  }) : super(key: key);
  final String? path;
  final Map<String, dynamic>? filters;
  final String? searchText;
  final String? title;
  final bool showAppBar;
  final bool isOffers;
  final ProductsTypes productsType;
  final bool allowPagination;

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final ProductsStore productsStore = ProductsStore();
  @override
  void initState() {
    if (widget.path != null) {
      productsStore.init(widget.path!, widget.productsType, widget.filters);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return LoadingWidget(
          isLoading:
              locator<CartStore>().loading || productsStore.gettingMoreData,
          child: Scaffold(
            appBar: widget.showAppBar
                ? AppBar(
                    title: Text(widget.title ?? ""),
                    actions: const [CartIconWidget()],
                  )
                : null,
            body: productsStore.model == null
                ? const LoadingView()
                : Column(
                    children: [
                      // if (widget.showAppBar)
                      //   Padding(
                      //     padding: const EdgeInsets.only(right: 16, left: 16),
                      //     child: Row(
                      //       children: const [
                      //         Expanded(child: SearchTextField()),
                      //       ],
                      //     ),
                      //   ),
                      Expanded(
                        child: productsStore.products.isEmpty
                            ? const NoProductsView()
                            : NotificationListener<ScrollNotification>(
                                onNotification: (scrollInfo) {
                                  if (widget.allowPagination) {
                                    if (scrollInfo.metrics.pixels ==
                                            scrollInfo
                                                .metrics.maxScrollExtent &&
                                        !productsStore.gettingMoreData) {
                                      productsStore.loadMore();
                                      return true;
                                    }
                                  }
                                  return false;
                                },
                                child: GridView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 16,
                                  ),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 340,
                                  ),
                                  itemCount: productsStore.products.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          SingleProductWidget(
                                    isOffer: widget.isOffers,
                                    product: productsStore.products[index],
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
