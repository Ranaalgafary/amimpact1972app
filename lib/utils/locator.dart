import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/account/stores/user_store/user_store.dart';
import 'package:amimpact/core/auth/stores/auth_store/auth_store.dart';
import 'package:amimpact/core/common/stores/home_store/home_store.dart';
import 'package:amimpact/core/common/stores/init_store/init_store.dart';
import 'package:amimpact/core/orders/stores/cart_store/cart_store.dart';
import 'package:amimpact/core/products/stores/categories_store/categories_store.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/utils/network_helper.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:amimpact/utils/network_services/common_service.dart';
import 'package:amimpact/utils/network_services/orders_service.dart';
import 'package:amimpact/utils/network_services/products_service.dart';
import 'package:amimpact/utils/prefs.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<NavHelper>(NavHelper());
  locator.registerSingleton<Prefs>(Prefs());
  locator.registerSingleton<UiHelper>(UiHelper());

  //Services
  locator.registerSingleton(NetworkHelper());
  locator.registerSingleton(CommonService());
  locator.registerSingleton(ProductService());
  locator.registerSingleton(AuthService());
  locator.registerSingleton(OrdersService());

  //Stores
  locator.registerLazySingleton(() => UserStore());
  locator.registerLazySingleton(() => AccountStore());
  locator.registerLazySingleton(() => CartStore());
  locator.registerLazySingleton(() => CategoriesStore());
  locator.registerLazySingleton(() => HomeStore());
  locator.registerLazySingleton(() => AuthStore());

  locator.registerSingleton(InitStore());
}
