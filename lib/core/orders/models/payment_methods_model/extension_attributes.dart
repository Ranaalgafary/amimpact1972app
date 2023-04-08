import 'dart:convert';

class ExtensionAttributes {
  List<dynamic>? taxGrandtotalDetails;

  ExtensionAttributes({this.taxGrandtotalDetails});

  factory ExtensionAttributes.fromMap(Map<String, dynamic> data) {
    return ExtensionAttributes(
      taxGrandtotalDetails: data['tax_grandtotal_details'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toMap() => {
        'tax_grandtotal_details': taxGrandtotalDetails,
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
