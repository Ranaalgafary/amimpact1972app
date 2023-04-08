import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/views/login_view/login_view.dart';
import 'package:amimpact/core/auth/views/no_account_view/no_account_view.dart';
import 'package:amimpact/core/products/models/products_model/products_model_data.dart';
import 'package:amimpact/core/products/models/reviews_model/review_model.dart';
import 'package:amimpact/utils/helpers/ui_helper.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/nav_helper.dart';
import 'package:amimpact/utils/network_services/products_service.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = ProductStoreBase with _$ProductStore;

abstract class ProductStoreBase with Store {
  late final ProductsModelData model;
  void init({required ProductsModelData model}) {
    this.model = model;

    getReviews();
  }

  List<ReviewModel>? reviews;

  @observable
  int currentIndex = 0;

  @observable
  bool loading = false;
  @observable
  int quantity = 1;

  Future addToWishList() async {
    if (locator<AccountStore>().isLoggedIn()) {
      loading = true;
      final res =
          await locator<ProductService>().addToWishList(model.sku ?? "");
      if (res is String) {
        locator<UiHelper>().showErrorMessage(res);
      }
      loading = false;
    } else {
      locator<NavHelper>().push(const NoAccountView());
    }
  }

  Future addRate(
      {required String comment,
      required String name,
      required double rate}) async {
    if (locator<AccountStore>().isLoggedIn()) {
      loading = true;
      final res = await locator<ProductService>().addRate(
        name: name,
        comment: comment,
        rate: rate,
        productId: model.id!,
      );
      if (res is String) {
        locator<UiHelper>().showErrorMessage(res);
      } else {
        locator<UiHelper>()
            .showErrorMessage("تم قبول التقييم وبإنتظار مراجعة الإدارة");
        // await getReviews();
        loading = false;

        return true;
      }
      loading = false;
    } else {
      locator<NavHelper>().push(const NoAccountView());
    }
  }

  Future getReviews() async {
    reviews = null;
    reviews = await locator<ProductService>().getReviews(model.id!);
  }
}
