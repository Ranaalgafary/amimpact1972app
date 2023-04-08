import 'package:amimpact/core/products/models/products_model/products_model.dart';
import 'package:amimpact/core/products/models/products_model/products_model_data.dart';
import 'package:amimpact/enums/products_types.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/products_service.dart';
import 'package:mobx/mobx.dart';

part 'products_store.g.dart';

class ProductsStore = ProductsStoreBase with _$ProductsStore;

abstract class ProductsStoreBase with Store {
  @observable
  ProductsModel? model;
  late final ProductsTypes type;
  late final String path;

  @observable
  ObservableList<ProductsModelData> products = ObservableList();

  int currentPage = 1;

  bool noMoreData = false;

  @observable
  bool gettingMoreData = false;
  Map<String, dynamic>? filters;

  Future init(
      String path, ProductsTypes type, Map<String, dynamic>? filters) async {
    this.path = path;
    this.type = type;
    this.filters = filters;
    if (filters == null) {
      getProducts();
    } else {
      getProductsWithFilters();
    }
  }

  Future getProducts({bool reset = true}) async {
    if (reset) {
      currentPage = 1;
      noMoreData = false;
      products.clear();
    }
    if (type == ProductsTypes.path) {
      model = await locator<ProductService>()
          .getProducts(path, currentPage: currentPage);
      currentPage = currentPage + 1;
      products.addAll(model?.products ?? []);
      if (model?.products.isEmpty ?? true) {
        noMoreData = true;
      }
    } else {
      model = await locator<ProductService>().search(path);
      products.addAll(model?.products ?? []);
    }
  }

  Future getProductsWithFilters({bool reset = true}) async {
    if (reset) {
      currentPage = 1;
      noMoreData = false;
      products.clear();
    }
    if (type == ProductsTypes.path) {
      model = await locator<ProductService>().getProductsWithFilters(
        path,
        currentPage: currentPage,
        filters: filters ?? {},
      );
      currentPage = currentPage + 1;
      products.addAll(model?.products ?? []);
      if (model?.products.isEmpty ?? true) {
        noMoreData = true;
      }
    } else {
      model = await locator<ProductService>().search(path);
      products.addAll(model?.products ?? []);
    }
  }

  Future loadMore() async {
    if (!noMoreData) {
      gettingMoreData = true;
      await getProducts(reset: false);
      gettingMoreData = false;
    }
  }
}
