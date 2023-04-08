import 'dart:convert';

import 'package:amimpact/core/products/models/products_model/products_model_data.dart';

class HomeProducts {
  List<ProductsModelData>? items;

  HomeProducts({this.items});

  factory HomeProducts.fromMap(Map<String, dynamic> data) => HomeProducts(
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => ProductsModelData.fromMap(e as Map<String, dynamic>))
            .where((element) => (element.quantity ?? 0) > 0)
            .toList(),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HomeProducts].
  factory HomeProducts.fromJson(String data) {
    return HomeProducts.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
