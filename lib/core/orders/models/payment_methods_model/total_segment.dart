import 'dart:convert';

import 'extension_attributes.dart';

class TotalSegment {
  String? code;
  String? title;
  num? value;
  ExtensionAttributes? extensionAttributes;
  String? area;

  TotalSegment({
    this.code,
    this.title,
    this.value,
    this.extensionAttributes,
    this.area,
  });

  factory TotalSegment.fromMap(Map<String, dynamic> data) => TotalSegment(
        code: data['code'] as String?,
        title: data['title'] as String?,
        value: data['value'] as num?,
        extensionAttributes: data['extension_attributes'] == null
            ? null
            : ExtensionAttributes.fromMap(
                data['extension_attributes'] as Map<String, dynamic>),
        area: data['area'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'code': code,
        'title': title,
        'value': value,
        'extension_attributes': extensionAttributes?.toMap(),
        'area': area,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TotalSegment].
  factory TotalSegment.fromJson(String data) {
    return TotalSegment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TotalSegment] to a JSON string.
  String toJson() => json.encode(toMap());
}
