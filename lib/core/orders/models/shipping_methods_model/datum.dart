import 'dart:convert';

class ShippingMethod {
  String? carrierCode;
  String? methodCode;
  String? carrierTitle;
  String? methodTitle;
  int? amount;
  int? baseAmount;
  bool? available;
  String? errorMessage;
  int? priceExclTax;
  int? priceInclTax;

  ShippingMethod({
    this.carrierCode,
    this.methodCode,
    this.carrierTitle,
    this.methodTitle,
    this.amount,
    this.baseAmount,
    this.available,
    this.errorMessage,
    this.priceExclTax,
    this.priceInclTax,
  });

  factory ShippingMethod.fromMap(Map<String, dynamic> data) => ShippingMethod(
        carrierCode: data['carrier_code'] as String?,
        methodCode: data['method_code'] as String?,
        carrierTitle: data['carrier_title'] as String?,
        methodTitle: data['method_title'] as String?,
        amount: data['amount'] as int?,
        baseAmount: data['base_amount'] as int?,
        available: data['available'] as bool?,
        errorMessage: data['error_message'] as String?,
        priceExclTax: data['price_excl_tax'] as int?,
        priceInclTax: data['price_incl_tax'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'carrier_code': carrierCode,
        'method_code': methodCode,
        'carrier_title': carrierTitle,
        'method_title': methodTitle,
        'amount': amount,
        'base_amount': baseAmount,
        'available': available,
        'error_message': errorMessage,
        'price_excl_tax': priceExclTax,
        'price_incl_tax': priceInclTax,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShippingMethod].
  factory ShippingMethod.fromJson(String data) {
    return ShippingMethod.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShippingMethod] to a JSON string.
  String toJson() => json.encode(toMap());
}
