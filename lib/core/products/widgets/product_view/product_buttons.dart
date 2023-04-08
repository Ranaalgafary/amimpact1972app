import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/views/no_account_view/no_account_view.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/products/stores/product_store/product_store.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:flutter/material.dart';

class ProductsButtons extends StatelessWidget {
  const ProductsButtons({Key? key, required this.store}) : super(key: key);
  final ProductStore store;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          children: [
            buildButton(
              context: context,
              text: "أضف إلي الأمنيات",
              icon: Icons.favorite_border_outlined,
              color: Theme.of(context).redColor,
              onPressed: store.addToWishList,
            ),
            const SizedBox(
              width: 8,
            ),
            buildButton(
              context: context,
              text: "أضف إلي السلة",
              icon: Icons.shopping_cart_outlined,
              color: Theme.of(context).greenColor,
              onPressed: () {
                if (locator<AccountStore>().isLoggedIn()) {
                  if (store.quantity > (store.model.quantity ?? 0)) {
                    locator<UiHelper>().showErrorMessage("لا يوجد تلك الكمية");
                  } else {
                    locator<CartStore>()
                        .addItem(store.quantity, store.model.sku!);
                  }
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const NoAccountView()),);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: RawMaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onPressed,
          fillColor: color,
          child: Stack(
            children: [
              Center(
                child: Icon(
                  icon,
                  color: Colors.black12,
                  size: 45,
                ),
              ),
              Center(
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .kufi12BoldTextStyle
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
