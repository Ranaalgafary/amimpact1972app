import 'package:amimpact/core/auth/stores/auth_store/auth_store.dart';
import 'package:amimpact/core/common/stores/home_store/home_store.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/products/stores/categories_store/categories_store.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/prefs.dart';
import 'package:mobx/mobx.dart';

part 'init_store.g.dart';

class InitStore = _InitStore with _$InitStore;

abstract class _InitStore with Store {
  Future init() async {
    await locator<AuthStore>().init();

    Future.wait([
      locator<HomeStore>().init(),
      locator<CategoriesStore>().init(),
    ]);
  }

  Future onLogin() async {
    Future.wait([locator<HomeStore>().init(), locator<CartStore>().init()]);
  }

  Future onLogout() async {
    await locator<Prefs>().setEmail("");
    await locator<Prefs>().setPassword("");
  }
}
