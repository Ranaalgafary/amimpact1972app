import 'dart:convert';

import 'custom_attribute.dart';

class Item {
  String? sku;
  String? name;
  int? price;
  List<CustomAttribute>? customAttributes;

  Item({this.sku, this.name, this.price, this.customAttributes});

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        sku: data['sku'] as String?,
        name: data['name'] as String?,
        price: data['price'] as int?,
        // customAttributes: (data['custom_attributes'] as List<dynamic>?)
        //     ?.map((e) => CustomAttribute.fromMap(e as Map<String, dynamic>))
        //     .toList(),
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
