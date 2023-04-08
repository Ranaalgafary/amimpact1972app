import 'dart:convert';

class Total {
  int? baseShippingAmount;
  int? baseShippingDiscountAmount;
  int? baseShippingDiscountTaxCompensationAmnt;
  int? baseShippingInclTax;
  int? baseShippingTaxAmount;
  int? shippingAmount;
  int? shippingDiscountAmount;
  int? shippingDiscountTaxCompensationAmount;
  int? shippingInclTax;
  int? shippingTaxAmount;

  Total({
    this.baseShippingAmount,
    this.baseShippingDiscountAmount,
    this.baseShippingDiscountTaxCompensationAmnt,
    this.baseShippingInclTax,
    this.baseShippingTaxAmount,
    this.shippingAmount,
    this.shippingDiscountAmount,
    this.shippingDiscountTaxCompensationAmount,
    this.shippingInclTax,
    this.shippingTaxAmount,
  });

  factory Total.fromMap(Map<String, dynamic> data) => Total(
        baseShippingAmount: data['base_shipping_amount'] as int?,
        baseShippingDiscountAmount:
            data['base_shipping_discount_amount'] as int?,
        baseShippingDiscountTaxCompensationAmnt:
            data['base_shipping_discount_tax_compensation_amnt'] as int?,
        baseShippingInclTax: data['base_shipping_incl_tax'] as int?,
        baseShippingTaxAmount: data['base_shipping_tax_amount'] as int?,
        shippingAmount: data['shipping_amount'] as int?,
        shippingDiscountAmount: data['shipping_discount_amount'] as int?,
        shippingDiscountTaxCompensationAmount:
            data['shipping_discount_tax_compensation_amount'] as int?,
        shippingInclTax: data['shipping_incl_tax'] as int?,
        shippingTaxAmount: data['shipping_tax_amount'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'base_shipping_amount': baseShippingAmount,
        'base_shipping_discount_amount': baseShippingDiscountAmount,
        'base_shipping_discount_tax_compensation_amnt':
            baseShippingDiscountTaxCompensationAmnt,
        'base_shipping_incl_tax': baseShippingInclTax,
        'base_shipping_tax_amount': baseShippingTaxAmount,
        'shipping_amount': shippingAmount,
        'shipping_discount_amount': shippingDiscountAmount,
        'shipping_discount_tax_compensation_amount':
            shippingDiscountTaxCompensationAmount,
        'shipping_incl_tax': shippingInclTax,
        'shipping_tax_amount': shippingTaxAmount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Total].
  factory Total.fromJson(String data) {
    return Total.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Total] to a JSON string.
  String toJson() => json.encode(toMap());
}
