import 'dart:convert';

import 'item.dart';
import 'total_segment.dart';

class Totals {
  num? grandTotal;
  num? baseGrandTotal;
  num? subtotal;
  num? baseSubtotal;
  num? discountAmount;
  num? baseDiscountAmount;
  num? subtotalWithDiscount;
  num? baseSubtotalWithDiscount;
  num? shippingAmount;
  num? baseShippingAmount;
  num? shippingDiscountAmount;
  num? baseShippingDiscountAmount;
  num? taxAmount;
  num? baseTaxAmount;
  dynamic weeeTaxAppliedAmount;
  num? shippingTaxAmount;
  num? baseShippingTaxAmount;
  num? subtotalInclTax;
  num? shippingInclTax;
  num? baseShippingInclTax;
  String? baseCurrencyCode;
  String? quoteCurrencyCode;
  num? itemsQty;
  List<Item>? items;
  List<TotalSegment>? totalSegments;

  Totals({
    this.grandTotal,
    this.baseGrandTotal,
    this.subtotal,
    this.baseSubtotal,
    this.discountAmount,
    this.baseDiscountAmount,
    this.subtotalWithDiscount,
    this.baseSubtotalWithDiscount,
    this.shippingAmount,
    this.baseShippingAmount,
    this.shippingDiscountAmount,
    this.baseShippingDiscountAmount,
    this.taxAmount,
    this.baseTaxAmount,
    this.weeeTaxAppliedAmount,
    this.shippingTaxAmount,
    this.baseShippingTaxAmount,
    this.subtotalInclTax,
    this.shippingInclTax,
    this.baseShippingInclTax,
    this.baseCurrencyCode,
    this.quoteCurrencyCode,
    this.itemsQty,
    this.items,
    this.totalSegments,
  });

  factory Totals.fromMap(Map<String, dynamic> data) => Totals(
        grandTotal: data['grand_total'] as num?,
        baseGrandTotal: data['base_grand_total'] as num?,
        subtotal: data['subtotal'] as num?,
        baseSubtotal: data['base_subtotal'] as num?,
        discountAmount: data['discount_amount'] as num?,
        baseDiscountAmount: data['base_discount_amount'] as num?,
        subtotalWithDiscount: data['subtotal_with_discount'] as num?,
        baseSubtotalWithDiscount: data['base_subtotal_with_discount'] as num?,
        shippingAmount: data['shipping_amount'] as num?,
        baseShippingAmount: data['base_shipping_amount'] as num?,
        shippingDiscountAmount: data['shipping_discount_amount'] as num?,
        baseShippingDiscountAmount:
            data['base_shipping_discount_amount'] as num?,
        taxAmount: data['tax_amount'] as num?,
        baseTaxAmount: data['base_tax_amount'] as num?,
        weeeTaxAppliedAmount: data['weee_tax_applied_amount'] as dynamic,
        shippingTaxAmount: data['shipping_tax_amount'] as num?,
        baseShippingTaxAmount: data['base_shipping_tax_amount'] as num?,
        subtotalInclTax: data['subtotal_incl_tax'] as num?,
        shippingInclTax: data['shipping_incl_tax'] as num?,
        baseShippingInclTax: data['base_shipping_incl_tax'] as num?,
        baseCurrencyCode: data['base_currency_code'] as String?,
        quoteCurrencyCode: data['quote_currency_code'] as String?,
        itemsQty: data['items_qty'] as num?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
        totalSegments: (data['total_segments'] as List<dynamic>?)
            ?.map((e) => TotalSegment.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'grand_total': grandTotal,
        'base_grand_total': baseGrandTotal,
        'subtotal': subtotal,
        'base_subtotal': baseSubtotal,
        'discount_amount': discountAmount,
        'base_discount_amount': baseDiscountAmount,
        'subtotal_with_discount': subtotalWithDiscount,
        'base_subtotal_with_discount': baseSubtotalWithDiscount,
        'shipping_amount': shippingAmount,
        'base_shipping_amount': baseShippingAmount,
        'shipping_discount_amount': shippingDiscountAmount,
        'base_shipping_discount_amount': baseShippingDiscountAmount,
        'tax_amount': taxAmount,
        'base_tax_amount': baseTaxAmount,
        'weee_tax_applied_amount': weeeTaxAppliedAmount,
        'shipping_tax_amount': shippingTaxAmount,
        'base_shipping_tax_amount': baseShippingTaxAmount,
        'subtotal_incl_tax': subtotalInclTax,
        'shipping_incl_tax': shippingInclTax,
        'base_shipping_incl_tax': baseShippingInclTax,
        'base_currency_code': baseCurrencyCode,
        'quote_currency_code': quoteCurrencyCode,
        'items_qty': itemsQty,
        'items': items?.map((e) => e.toMap()).toList(),
        'total_segments': totalSegments?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Totals].
  factory Totals.fromJson(String data) {
    return Totals.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Totals] to a JSON string.
  String toJson() => json.encode(toMap());
}
