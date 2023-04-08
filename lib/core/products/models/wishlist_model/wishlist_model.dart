import 'package:amimpact/core/products/models/products_model/products_model_data.dart';

class WishlistModel {
  final List<WishlistModelData> products;

  WishlistModel({required this.products});

  factory WishlistModel.fromMap(Map<String, dynamic> map) {
    return WishlistModel(
      products: map["items"] == null
          ? []
          : (map['items'] as List<dynamic>)
              .map(
                (e) => WishlistModelData.fromMap(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}

class WishlistModelData {
  final ProductsModelData product;
  final int id;

  WishlistModelData({required this.product, required this.id});

  factory WishlistModelData.fromMap(Map<String, dynamic> map) {
    return WishlistModelData(
      id: map["id"] as int,
      product:
          ProductsModelData.fromMap(map["product"] as Map<String, dynamic>),
    );
  }
}
