import 'dart:convert';
import 'dart:developer';

import 'package:amimpact/core/products/models/products_model/product_attribute.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class ProductsModelData {
  String? sku;
  String? name;
  int? id;
  num? price;
  List<ProductAttribute>? attributes;
  List<ProductSlider> slider;
  final num? quantity;

  ProductsModelData({
    required this.slider,
    this.sku,
    this.name,
    this.quantity,
    this.price,
    this.attributes,
    this.id,
  });

  factory ProductsModelData.fromMap(Map<String, dynamic> data) =>
      ProductsModelData(
        slider: data["media_gallery_entries"] == null
            ? []
            : (data['media_gallery_entries'] as List<dynamic>?)
                    ?.map(
                        (e) => ProductSlider.fromMap(e as Map<String, dynamic>))
                    .toList() ??
                [],
        sku: data['sku'] as String?,
        id: data["id"] as int?,
        quantity: data["extension_attributes"]["stock_item"]["qty"] as num?,
        name: data['name'] as String?,
        price: data['price'] as num?,
        attributes: (data['custom_attributes'] as List<dynamic>?)
            ?.map((e) => ProductAttribute.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  factory ProductsModelData.fromJson(String data) {
    return ProductsModelData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String? getShortDesc() =>
      Bidi.stripHtmlIfNeeded(getValue("short_description") as String? ?? "")
          .replaceAll("-", "\n- ");
  double getRate() =>
      double.tryParse(getValue("sorting_rating") as String? ?? "") ?? 0;

  String? getImage() {
    return getValue("image") as String?;
  }

  String? getDiscountPrice() {
    return getValue("special_price") as String?;
  }

  dynamic getValue(String attribute) {
    return attributes == null
        ? null
        : attributes!
            .firstWhereOrNull((element) => element.code == attribute)
            ?.value;
  }
}

class ProductSlider {
  String? image;
  ProductSlider({this.image});

  factory ProductSlider.fromMap(Map<String, dynamic> data) =>
      ProductSlider(image: data["file"] as String?);
}
