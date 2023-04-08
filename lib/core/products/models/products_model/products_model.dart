import 'package:amimpact/core/products/models/products_model/products_model_data.dart';

class ProductsModel {
  final List<ProductsModelData> products;

  ProductsModel({required this.products});

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      products: map["items"] == null
          ? []
          : (map['items'] as List<dynamic>)
              .map(
                (e) => ProductsModelData.fromMap(e as Map<String, dynamic>),
              )
              .where((element) => (element.quantity ?? 0) > 0)
              .toList(),
    );
  }
}
