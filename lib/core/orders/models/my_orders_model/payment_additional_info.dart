import 'dart:convert';

class PaymentAdditionalInfo {
  String? key;
  String? value;

  PaymentAdditionalInfo({this.key, this.value});

  factory PaymentAdditionalInfo.fromMap(Map<String, dynamic> data) {
    return PaymentAdditionalInfo(
      key: data['key'] as String?,
      value: data['value'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'key': key,
        'value': value,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentAdditionalInfo].
  factory PaymentAdditionalInfo.fromJson(String data) {
    return PaymentAdditionalInfo.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentAdditionalInfo] to a JSON string.
  String toJson() => json.encode(toMap());
}
