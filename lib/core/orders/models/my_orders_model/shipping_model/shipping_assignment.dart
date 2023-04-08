import 'dart:convert';

import 'shipping.dart';

class ShippingAssignment {
  Shipping? shipping;

  ShippingAssignment({this.shipping});

  factory ShippingAssignment.fromMap(Map<String, dynamic> data) {
    return ShippingAssignment(
      shipping: data['shipping'] == null
          ? null
          : Shipping.fromMap(data['shipping'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'shipping': shipping?.toMap(),
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
