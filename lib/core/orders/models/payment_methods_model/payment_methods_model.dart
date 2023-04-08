import 'dart:convert';

import 'payment_method.dart';
import 'totals.dart';

class PaymentMethodsModel {
  List<PaymentMethod>? paymentMethods;
  Totals? totals;

  PaymentMethodsModel({this.paymentMethods, this.totals});

  factory PaymentMethodsModel.fromMap(Map<String, dynamic> data) {
    return PaymentMethodsModel(
      paymentMethods: (data['payment_methods'] as List<dynamic>?)
          ?.map((e) => PaymentMethod.fromMap(e as Map<String, dynamic>))
          .toList(),
      totals: data['totals'] == null
          ? null
          : Totals.fromMap(data['totals'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'payment_methods': paymentMethods?.map((e) => e.toMap()).toList(),
        'totals': totals?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentMethodsModel].
  factory PaymentMethodsModel.fromJson(String data) {
    return PaymentMethodsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentMethodsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
