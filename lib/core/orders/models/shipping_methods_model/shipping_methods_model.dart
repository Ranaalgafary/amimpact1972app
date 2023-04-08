import 'dart:convert';

import 'datum.dart';

class ShippingMethodsModel {
  List<ShippingMethod>? data;

  ShippingMethodsModel({this.data});

  factory ShippingMethodsModel.fromMap(Map<String, dynamic> data) {
    return ShippingMethodsModel(
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => ShippingMethod.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShippingMethodsModel].
  factory ShippingMethodsModel.fromJson(String data) {
    return ShippingMethodsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShippingMethodsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
