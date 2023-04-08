import 'dart:convert';

import 'extension_attributes.dart';

class CartItem {
  int? itemId;
  String? sku;
  int? qty;
  String? name;
  num? price;
  String? productType;
  String? quoteId;
  ExtensionAttributes? extensionAttributes;

  CartItem({
    this.itemId,
    this.sku,
    this.qty,
    this.name,
    this.price,
    this.productType,
    this.quoteId,
    this.extensionAttributes,
  });

  factory CartItem.fromMap(Map<String, dynamic> data) => CartItem(
        itemId: data['item_id'] as int?,
        sku: data['sku'] as String?,
        qty: data['qty'] as int?,
        name: data['name'] as String?,
        price: data['price'] as num?,
        productType: data['product_type'] as String?,
        quoteId: data['quote_id'] as String?,
        extensionAttributes: data['extension_attributes'] == null
            ? null
            : ExtensionAttributes.fromMap(
                data['extension_attributes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'item_id': itemId,
        'sku': sku,
        'qty': qty,
        'name': name,
        'price': price,
        'product_type': productType,
        'quote_id': quoteId,
        'extension_attributes': extensionAttributes?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CartItem].
  factory CartItem.fromJson(String data) {
    return CartItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CartItem] to a JSON string.
  String toJson() => json.encode(toMap());
}
