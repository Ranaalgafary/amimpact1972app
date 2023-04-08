import 'package:amimpact/core/orders/models/cart_model/cart_model.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/orders_service.dart';
import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

class CartStore = CartStoreBase with _$CartStore;

abstract class CartStoreBase with Store {
  @observable
  CartModel? cart;

  @observable
  bool loading = false;

  Future init() async {
    cart = null;
    await Future.wait([getCartModel()]);
  }

  Future getCartModel() async {
    cart = await locator<OrdersService>().getCart();
    itemCount = cart?.itemsCount ?? 0;
    totalPrice = 0;
    cart?.items?.forEach((element) {
      totalPrice = totalPrice + ((element.price ?? 0) * (element.qty ?? 0));
    });
  }

  Future removeItem(int qty, String sku, int itemId) async {
    loading = true;
    final res = await locator<OrdersService>().removeCartItem(
      cartId: cart!.id!,
      itemId: itemId,
    );
    if (res is! String) {
      await getCartModel();
    } else {
      locator<UiHelper>().showErrorMessage("فشلت العملية");
    }
    loading = false;
  }

  Future decrease(int qty, String sku, int itemId) async {
    loading = true;
    final res = await locator<OrdersService>()
        .updateCartItem(cartId: cart!.id!, sku: sku, qty: qty, itemId: itemId);
    if (res is! String) {
      await getCartModel();
    } else {
      locator<UiHelper>().showErrorMessage(res);
    }
    loading = false;
  }

  Future addItem(int qty, String sku) async {
    loading = true;
    final res = await locator<OrdersService>()
        .addCartItem(cartId: cart!.id!, sku: sku, qty: qty);
    if (res is! String) {
      await getCartModel();
    } else {
      locator<UiHelper>().showErrorMessage(res);
    }
    loading = false;
  }

  @observable
  int itemCount = 0;

  @observable
  num totalPrice = 0;
}
