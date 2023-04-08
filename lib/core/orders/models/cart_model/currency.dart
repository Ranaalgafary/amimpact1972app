import 'dart:convert';

class Currency {
  String? globalCurrencyCode;
  String? baseCurrencyCode;
  String? storeCurrencyCode;
  String? quoteCurrencyCode;
  int? storeToBaseRate;
  int? storeToQuoteRate;
  int? baseToGlobalRate;
  int? baseToQuoteRate;

  Currency({
    this.globalCurrencyCode,
    this.baseCurrencyCode,
    this.storeCurrencyCode,
    this.quoteCurrencyCode,
    this.storeToBaseRate,
    this.storeToQuoteRate,
    this.baseToGlobalRate,
    this.baseToQuoteRate,
  });

  factory Currency.fromMap(Map<String, dynamic> data) => Currency(
        globalCurrencyCode: data['global_currency_code'] as String?,
        baseCurrencyCode: data['base_currency_code'] as String?,
        storeCurrencyCode: data['store_currency_code'] as String?,
        quoteCurrencyCode: data['quote_currency_code'] as String?,
        storeToBaseRate: data['store_to_base_rate'] as int?,
        storeToQuoteRate: data['store_to_quote_rate'] as int?,
        baseToGlobalRate: data['base_to_global_rate'] as int?,
        baseToQuoteRate: data['base_to_quote_rate'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'global_currency_code': globalCurrencyCode,
        'base_currency_code': baseCurrencyCode,
        'store_currency_code': storeCurrencyCode,
        'quote_currency_code': quoteCurrencyCode,
        'store_to_base_rate': storeToBaseRate,
        'store_to_quote_rate': storeToQuoteRate,
        'base_to_global_rate': baseToGlobalRate,
        'base_to_quote_rate': baseToQuoteRate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Currency].
  factory Currency.fromJson(String data) {
    return Currency.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Currency] to a JSON string.
  String toJson() => json.encode(toMap());
}
