import 'dart:convert';

import 'extension_attributes.dart';

class ShippingModel {
  ExtensionAttributes? extensionAttributes;

  ShippingModel({this.extensionAttributes});

  factory ShippingModel.fromMap(Map<String, dynamic> data) => ShippingModel(
        extensionAttributes: data['extension_attributes'] == null
            ? null
            : ExtensionAttributes.fromMap(
                data['extension_attributes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'extension_attributes': extensionAttributes?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShippingModel].
  factory ShippingModel.fromJson(String data) {
    return ShippingModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShippingModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
