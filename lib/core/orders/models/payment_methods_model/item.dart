import 'dart:convert';

class Item {
  int? itemId;
  int? price;
  int? basePrice;
  int? qty;
  int? rowTotal;
  int? baseRowTotal;
  int? rowTotalWithDiscount;
  int? taxAmount;
  int? baseTaxAmount;
  int? taxPercent;
  int? discountAmount;
  int? baseDiscountAmount;
  int? discountPercent;
  int? priceInclTax;
  int? basePriceInclTax;
  int? rowTotalInclTax;
  int? baseRowTotalInclTax;
  String? options;
  dynamic weeeTaxAppliedAmount;
  dynamic weeeTaxApplied;
  String? name;

  Item({
    this.itemId,
    this.price,
    this.basePrice,
    this.qty,
    this.rowTotal,
    this.baseRowTotal,
    this.rowTotalWithDiscount,
    this.taxAmount,
    this.baseTaxAmount,
    this.taxPercent,
    this.discountAmount,
    this.baseDiscountAmount,
    this.discountPercent,
    this.priceInclTax,
    this.basePriceInclTax,
    this.rowTotalInclTax,
    this.baseRowTotalInclTax,
    this.options,
    this.weeeTaxAppliedAmount,
    this.weeeTaxApplied,
    this.name,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        itemId: data['item_id'] as int?,
        price: data['price'] as int?,
        basePrice: data['base_price'] as int?,
        qty: data['qty'] as int?,
        rowTotal: data['row_total'] as int?,
        baseRowTotal: data['base_row_total'] as int?,
        rowTotalWithDiscount: data['row_total_with_discount'] as int?,
        taxAmount: data['tax_amount'] as int?,
        baseTaxAmount: data['base_tax_amount'] as int?,
        taxPercent: data['tax_percent'] as int?,
        discountAmount: data['discount_amount'] as int?,
        baseDiscountAmount: data['base_discount_amount'] as int?,
        discountPercent: data['discount_percent'] as int?,
        priceInclTax: data['price_incl_tax'] as int?,
        basePriceInclTax: data['base_price_incl_tax'] as int?,
        rowTotalInclTax: data['row_total_incl_tax'] as int?,
        baseRowTotalInclTax: data['base_row_total_incl_tax'] as int?,
        options: data['options'] as String?,
        weeeTaxAppliedAmount: data['weee_tax_applied_amount'] as dynamic,
        weeeTaxApplied: data['weee_tax_applied'] as dynamic,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'item_id': itemId,
        'price': price,
        'base_price': basePrice,
        'qty': qty,
        'row_total': rowTotal,
        'base_row_total': baseRowTotal,
        'row_total_with_discount': rowTotalWithDiscount,
        'tax_amount': taxAmount,
        'base_tax_amount': baseTaxAmount,
        'tax_percent': taxPercent,
        'discount_amount': discountAmount,
        'base_discount_amount': baseDiscountAmount,
        'discount_percent': discountPercent,
        'price_incl_tax': priceInclTax,
        'base_price_incl_tax': basePriceInclTax,
        'row_total_incl_tax': rowTotalInclTax,
        'base_row_total_incl_tax': baseRowTotalInclTax,
        'options': options,
        'weee_tax_applied_amount': weeeTaxAppliedAmount,
        'weee_tax_applied': weeeTaxApplied,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());
}
