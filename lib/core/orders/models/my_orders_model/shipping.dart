import 'dart:convert';

import 'address.dart';
import 'total.dart';

class Shipping {
  Address? address;
  String? method;
  Total? total;

  Shipping({this.address, this.method, this.total});

  factory Shipping.fromMap(Map<String, dynamic> data) => Shipping(
        address: data['address'] == null
            ? null
            : Address.fromMap(data['address'] as Map<String, dynamic>),
        method: data['method'] as String?,
        total: data['total'] == null
            ? null
            : Total.fromMap(data['total'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'address': address?.toMap(),
        'method': method,
        'total': total?.toMap(),
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
