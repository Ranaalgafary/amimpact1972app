import 'package:amimpact/core/common/widgets/general/loading_view.dart';
import 'package:amimpact/core/common/widgets/general/loading_widget.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/orders/widgets/cart/cart_item_widget.dart';
import 'package:amimpact/utils/extension/theme_extension.dart';
import 'package:amimpact/utils/constants.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/core/orders/views/checkout_view/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key, this.showAppBar = false}) : super(key: key);
  final bool showAppBar;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final store = locator<CartStore>();
  @override
  void initState() {
    store.getCartModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: const Text("سلة المشتريات"),
            )
          : null,
      body: Observer(builder: (context) {
        if (store.cart == null) {
          return const LoadingView();
        } else {
          return LoadingWidget(
            isLoading: store.loading,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (store.cart?.items?.isEmpty ?? true)
                  const Center(
                    child: Text("لا يوجد منتجات في سلة المشتريات"),
                  )
                else
                  ListView.builder(
                    itemCount: store.cart?.items?.length ?? 0,
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 180,
                      left: 16,
                      right: 16,
                    ),
                    itemBuilder: (_, index) => CartItemWidget(
                      item: store.cart!.items![index],
                    ),
                  ),
                if (!(store.cart?.items?.isEmpty ?? true))
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8)),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        height: 155,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "المجموع",
                                  style: Theme.of(context)
                                      .textTheme
                                      .kufi20BoldTextStyle
                                      .copyWith(
                                          color: Colors.black, fontSize: 16),
                                ),
                                const Spacer(),
                                Text(
                                  "${store.totalPrice}",
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
                            ),
                            Container(
                              height: 45,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: RawMaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                fillColor: store.cart?.items?.isEmpty ?? false
                                    ? Colors.grey
                                    : Theme.of(context).greenColor,
                                onPressed: store.cart?.items?.isEmpty ?? false
                                    ? null
                                    : () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => CheckoutView(),
                                          ),
                                        );
                                      },
                                child: const Text(
                                  "إتمام الدفع",
                                  style: TextStyle(
                                    fontFamily: kHacinFont,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          );
        }
      }),
    );
  }
}
