import 'dart:convert';

class Item {
  int? amountRefunded;
  int? baseAmountRefunded;
  double? baseCost;
  int? baseDiscountAmount;
  int? baseDiscountInvoiced;
  int? baseDiscountTaxCompensationAmount;
  int? baseOriginalPrice;
  int? basePrice;
  int? basePriceInclTax;
  int? baseRowInvoiced;
  int? baseRowTotal;
  int? baseRowTotalInclTax;
  int? baseTaxAmount;
  int? baseTaxInvoiced;
  String? createdAt;
  int? discountAmount;
  int? discountInvoiced;
  int? discountPercent;
  int? freeShipping;
  int? discountTaxCompensationAmount;
  int? isQtyDecimal;
  int? isVirtual;
  int? itemId;
  String? name;
  int? noDiscount;
  int? orderId;
  int? originalPrice;
  int? price;
  int? priceInclTax;
  int? productId;
  String? productType;
  int? qtyCanceled;
  int? qtyInvoiced;
  int? qtyOrdered;
  int? qtyRefunded;
  int? qtyShipped;
  int? quoteItemId;
  int? rowInvoiced;
  int? rowTotal;
  int? rowTotalInclTax;
  int? rowWeight;
  String? sku;
  int? storeId;
  int? taxAmount;
  int? taxInvoiced;
  int? taxPercent;
  String? updatedAt;
  int? weight;

  Item({
    this.amountRefunded,
    this.baseAmountRefunded,
    this.baseCost,
    this.baseDiscountAmount,
    this.baseDiscountInvoiced,
    this.baseDiscountTaxCompensationAmount,
    this.baseOriginalPrice,
    this.basePrice,
    this.basePriceInclTax,
    this.baseRowInvoiced,
    this.baseRowTotal,
    this.baseRowTotalInclTax,
    this.baseTaxAmount,
    this.baseTaxInvoiced,
    this.createdAt,
    this.discountAmount,
    this.discountInvoiced,
    this.discountPercent,
    this.freeShipping,
    this.discountTaxCompensationAmount,
    this.isQtyDecimal,
    this.isVirtual,
    this.itemId,
    this.name,
    this.noDiscount,
    this.orderId,
    this.originalPrice,
    this.price,
    this.priceInclTax,
    this.productId,
    this.productType,
    this.qtyCanceled,
    this.qtyInvoiced,
    this.qtyOrdered,
    this.qtyRefunded,
    this.qtyShipped,
    this.quoteItemId,
    this.rowInvoiced,
    this.rowTotal,
    this.rowTotalInclTax,
    this.rowWeight,
    this.sku,
    this.storeId,
    this.taxAmount,
    this.taxInvoiced,
    this.taxPercent,
    this.updatedAt,
    this.weight,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        amountRefunded: data['amount_refunded'] as int?,
        baseAmountRefunded: data['base_amount_refunded'] as int?,
        baseCost: (data['base_cost'] as num?)?.toDouble(),
        baseDiscountAmount: data['base_discount_amount'] as int?,
        baseDiscountInvoiced: data['base_discount_invoiced'] as int?,
        baseDiscountTaxCompensationAmount:
            data['base_discount_tax_compensation_amount'] as int?,
        baseOriginalPrice: data['base_original_price'] as int?,
        basePrice: data['base_price'] as int?,
        basePriceInclTax: data['base_price_incl_tax'] as int?,
        baseRowInvoiced: data['base_row_invoiced'] as int?,
        baseRowTotal: data['base_row_total'] as int?,
        baseRowTotalInclTax: data['base_row_total_incl_tax'] as int?,
        baseTaxAmount: data['base_tax_amount'] as int?,
        baseTaxInvoiced: data['base_tax_invoiced'] as int?,
        createdAt: data['created_at'] as String?,
        discountAmount: data['discount_amount'] as int?,
        discountInvoiced: data['discount_invoiced'] as int?,
        discountPercent: data['discount_percent'] as int?,
        freeShipping: data['free_shipping'] as int?,
        discountTaxCompensationAmount:
            data['discount_tax_compensation_amount'] as int?,
        isQtyDecimal: data['is_qty_decimal'] as int?,
        isVirtual: data['is_virtual'] as int?,
        itemId: data['item_id'] as int?,
        name: data['name'] as String?,
        noDiscount: data['no_discount'] as int?,
        orderId: data['order_id'] as int?,
        originalPrice: data['original_price'] as int?,
        price: data['price'] as int?,
        priceInclTax: data['price_incl_tax'] as int?,
        productId: data['product_id'] as int?,
        productType: data['product_type'] as String?,
        qtyCanceled: data['qty_canceled'] as int?,
        qtyInvoiced: data['qty_invoiced'] as int?,
        qtyOrdered: data['qty_ordered'] as int?,
        qtyRefunded: data['qty_refunded'] as int?,
        qtyShipped: data['qty_shipped'] as int?,
        quoteItemId: data['quote_item_id'] as int?,
        rowInvoiced: data['row_invoiced'] as int?,
        rowTotal: data['row_total'] as int?,
        rowTotalInclTax: data['row_total_incl_tax'] as int?,
        rowWeight: data['row_weight'] as int?,
        sku: data['sku'] as String?,
        storeId: data['store_id'] as int?,
        taxAmount: data['tax_amount'] as int?,
        taxInvoiced: data['tax_invoiced'] as int?,
        taxPercent: data['tax_percent'] as int?,
        updatedAt: data['updated_at'] as String?,
        weight: data['weight'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'amount_refunded': amountRefunded,
        'base_amount_refunded': baseAmountRefunded,
        'base_cost': baseCost,
        'base_discount_amount': baseDiscountAmount,
        'base_discount_invoiced': baseDiscountInvoiced,
        'base_discount_tax_compensation_amount':
            baseDiscountTaxCompensationAmount,
        'base_original_price': baseOriginalPrice,
        'base_price': basePrice,
        'base_price_incl_tax': basePriceInclTax,
        'base_row_invoiced': baseRowInvoiced,
        'base_row_total': baseRowTotal,
        'base_row_total_incl_tax': baseRowTotalInclTax,
        'base_tax_amount': baseTaxAmount,
        'base_tax_invoiced': baseTaxInvoiced,
        'created_at': createdAt,
        'discount_amount': discountAmount,
        'discount_invoiced': discountInvoiced,
        'discount_percent': discountPercent,
        'free_shipping': freeShipping,
        'discount_tax_compensation_amount': discountTaxCompensationAmount,
        'is_qty_decimal': isQtyDecimal,
        'is_virtual': isVirtual,
        'item_id': itemId,
        'name': name,
        'no_discount': noDiscount,
        'order_id': orderId,
        'original_price': originalPrice,
        'price': price,
        'price_incl_tax': priceInclTax,
        'product_id': productId,
        'product_type': productType,
        'qty_canceled': qtyCanceled,
        'qty_invoiced': qtyInvoiced,
        'qty_ordered': qtyOrdered,
        'qty_refunded': qtyRefunded,
        'qty_shipped': qtyShipped,
        'quote_item_id': quoteItemId,
        'row_invoiced': rowInvoiced,
        'row_total': rowTotal,
        'row_total_incl_tax': rowTotalInclTax,
        'row_weight': rowWeight,
        'sku': sku,
        'store_id': storeId,
        'tax_amount': taxAmount,
        'tax_invoiced': taxInvoiced,
        'tax_percent': taxPercent,
        'updated_at': updatedAt,
        'weight': weight,
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
