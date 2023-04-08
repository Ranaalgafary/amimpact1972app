import 'dart:convert';

import 'shipping_assignment.dart';

class ExtensionAttributes {
  List<ShippingAssignment>? shippingAssignments;

  ExtensionAttributes({this.shippingAssignments});

  factory ExtensionAttributes.fromMap(Map<String, dynamic> data) {
    return ExtensionAttributes(
      shippingAssignments: (data['shipping_assignments'] as List<dynamic>?)
          ?.map((e) => ShippingAssignment.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'shipping_assignments':
            shippingAssignments?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExtensionAttributes].
  factory ExtensionAttributes.fromJson(String data) {
    return ExtensionAttributes.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExtensionAttributes] to a JSON string.
  String toJson() => json.encode(toMap());
}
