import 'dart:convert';

import 'address.dart';

class Shipping {
  Address? address;
  dynamic method;
  num? shipmentAmount;
  Shipping({this.address, this.shipmentAmount, this.method});

  factory Shipping.fromMap(Map<String, dynamic> data) => Shipping(
      address: data['address'] == null
          ? null
          : Address.fromMap(data['address'] as Map<String, dynamic>),
      method: data['method'] as dynamic,
      shipmentAmount: data['total']?['base_shipping_amount'] as num?);

  Map<String, dynamic> toMap() => {
        'address': address?.toMap(),
        'method': method,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Shipping].
  factory Shipping.fromJson(String data) {
    return Shipping.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Shipping] to a JSON string.
  String toJson() => json.encode(toMap());
}
