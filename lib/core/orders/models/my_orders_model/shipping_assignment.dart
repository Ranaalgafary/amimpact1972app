import 'dart:convert';

import 'item.dart';
import 'shipping.dart';

class ShippingAssignment {
  Shipping? shipping;
  List<Item>? items;

  ShippingAssignment({this.shipping, this.items});

  factory ShippingAssignment.fromMap(Map<String, dynamic> data) {
    return ShippingAssignment(
      shipping: data['shipping'] == null
          ? null
          : Shipping.fromMap(data['shipping'] as Map<String, dynamic>),
      items: (data['items'] as List<dynamic>?)
          ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'shipping': shipping?.toMap(),
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShippingAssignment].
  factory ShippingAssignment.fromJson(String data) {
    return ShippingAssignment.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShippingAssignment] to a JSON string.
  String toJson() => json.encode(toMap());
}
