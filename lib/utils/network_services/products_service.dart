import 'dart:developer';

import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/common/models/home_model/home_model.dart';
import 'package:amimpact/core/products/models/products_model/products_model.dart';
import 'package:amimpact/core/products/models/reviews_model/review_model.dart';
import 'package:amimpact/core/products/models/wishlist_model/wishlist_model.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_helper.dart';

class ProductService {
  final _dio = locator<NetworkHelper>().dio;

  Future<ProductsModel?> getProducts(String p,
      {int currentPage = 100000}) async {
    final path = p.replaceAll(
      "searchCriteria[currentPage]=1&",
      "searchCriteria[currentPage]=$currentPage&",
    );

    final res = await _dio.post(
      "get_data_by_path",
      data: {"path": path},
    );
    return ProductsModel.fromMap(res.data as Map<String, dynamic>);
  }

  Future<ProductsModel?> getProductsWithFilters(
    String p, {
    int currentPage = 100000,
    required Map<String, dynamic> filters,
  }) async {
    final path = p.replaceAll(
      "searchCriteria[currentPage]=1&",
      "searchCriteria[currentPage]=$currentPage&",
    );

    final Map<String, dynamic> filtersMap = {};

    filters.keys.forEach((element) {
      if (filters[element]["value"]?["value"] != null) {
        filtersMap[element] = filters[element]["value"]["value"];
      }
    });
    final Map<String, dynamic> fil = {};
    for (int index = 0; index < filtersMap.length; index++) {
      final key = filtersMap.keys.toList()[index];
      fil.addAll({
        "searchkey_${index + 1}": key,
        "searchval_${index + 1}": filtersMap[key],
      });
      filtersMap.forEach((key, value) {});
    }

    final res = await _dio.post(
      "get_data_by_filter_path",
      data: {"old_path": path, ...fil},
    );
    return ProductsModel.fromMap(res.data as Map<String, dynamic>);
  }

  Future<ProductsModel?> search(String text) async {
    final res = await _dio.post(
      "search",
      data: {"text": text},
    );
    return ProductsModel.fromMap(res.data as Map<String, dynamic>);
  }

  Future addToWishList(String sku) async {
    try {
      final res = await _dio.post(
        "add_wishlist",
        data: {
          "token": locator<AccountStore>().token,
          "sku": sku,
        },
      );
      if (res.data is bool && res.data as bool) return true;
      if (res.data["message"] != null) {
        return res.data["message"];
      }
      return true;
    } catch (_) {
      return "فشلت العملية";
    }
  }

  Future addRate(
      {String? comment,
      required String name,
      required double rate,
      required int productId}) async {
    try {
      await _dio.post(
        "Add_review",
        data: {
          "customerId": locator<AccountStore>().user?.id,
          "productId": productId,
          "stars": rate,
          "detail": comment,
          "nickname": name
        },
      );

      return true;
    } catch (_) {
      return "فشلت العملية";
    }
  }

  Future removeFromWishlist(int id) async {
    try {
      final res = await _dio.post(
        "delete_wishlist",
        data: {
          "token": locator<AccountStore>().token,
          "itemId": id,
        },
      );
      if (res.data is bool && res.data as bool) return true;
      if (res.data["message"] != null) {
        return res.data["message"];
      }
      return true;
    } catch (_) {
      return "فشلت العملية";
    }
  }

  Future<WishlistModel?> wishList() async {
    try {
      final res = await _dio.post(
        "get_wishlist",
        data: {"token": "${locator<AccountStore>().token}"},
      );
      return WishlistModel.fromMap(res.data as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<List<ReviewModel>> getReviews(int productId) async {
    try {
      final res = await _dio.post(
        "get_reviews",
        data: {"productId": productId},
      );
      return (res.data as List<dynamic>?)
              ?.map((e) => ReviewModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [];
    } catch (_) {
      return [];
    }
  }

  Future<Map<String, dynamic>> getProductAttributes(int productId) async {
    try {
      final res = await _dio.post(
        "getattributes",
        data: {"product_id": productId},
      );
      return res.data as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }
}
