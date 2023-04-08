import 'dart:convert';

class PaymentMethod {
  String? code;
  String? title;

  PaymentMethod({this.code, this.title});

  factory PaymentMethod.fromMap(Map<String, dynamic> data) => PaymentMethod(
        code: data['code'] as String?,
        title: data['title'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'code': code,
        'title': title,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentMethod].
  factory PaymentMethod.fromJson(String data) {
    return PaymentMethod.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentMethod] to a JSON string.
  String toJson() => json.encode(toMap());
}
