import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/orders/widgets/cart/cart_icon_widget.dart';
import 'package:amimpact/core/products/models/products_model/products_model_data.dart';
import 'package:amimpact/core/products/stores/product_store/product_store.dart';
import 'package:amimpact/core/products/widgets/product_view/add_rate_widget.dart';
import 'package:amimpact/core/products/widgets/product_view/price_widget.dart';
import 'package:amimpact/core/products/widgets/product_view/product_buttons.dart';
import 'package:amimpact/core/products/widgets/product_view/product_image.dart';
import 'package:amimpact/core/products/widgets/product_view/quantity_widget.dart';
import 'package:amimpact/core/products/widgets/product_view/rates_widget.dart';
import 'package:amimpact/core/products/widgets/product_view/specifications_widget.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key, required this.model}) : super(key: key);
  final ProductsModelData model;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProductStore productStore = ProductStore();
  @override
  void initState() {
    productStore.init(model: widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productStore.model.name ?? ""),
        actions: const [CartIconWidget()],
      ),
      body: Observer(
        builder: (context) {
          return LoadingWidget(
            isLoading: locator<CartStore>().loading || productStore.loading,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.only(bottom: 100, top: 24),
                    children: [
                      ProductImage(
                        productStore: productStore,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      PriceWidget(store: productStore),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: QuantityWidget(
                          productStore: productStore,
                        ),
                      ),
                      Text(
                        "الوصف",
                        style: Theme.of(context)
                            .textTheme
                            .kufi14RegularTextStyle
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        productStore.model.getShortDesc() ?? "",
                        style: const TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          fontFamily: kBeinFont,
                          color: Color(0xff929292),
                        ),
                      ),
                      SpecificationsWidget(productId: widget.model.id!),
                      AddRateWidget(
                        store: productStore,
                      ),
                      RatesWidget(
                        store: productStore,
                      ),
                    ],
                  ),
                  ProductsButtons(
                    store: productStore,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
