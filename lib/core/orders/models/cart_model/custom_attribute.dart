import 'dart:convert';

class CustomAttribute {
  String? attributeCode;
  String? value;

  CustomAttribute({this.attributeCode, this.value});

  factory CustomAttribute.fromMap(Map<String, dynamic> data) {
    return CustomAttribute(
      attributeCode: data['attribute_code'] as String?,
      value: data['value'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'attribute_code': attributeCode,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CustomAttribute].
  factory CustomAttribute.fromJson(String data) {
    return CustomAttribute.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CustomAttribute] to a JSON string.
  String toJson() => json.encode(toMap());
}
