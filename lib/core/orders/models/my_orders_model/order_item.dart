import 'dart:convert';

import 'extension_attributes.dart';

class OrderItem {
  num? amountRefunded;
  num? baseAmountRefunded;
  double? baseCost;
  num? baseDiscountAmount;
  num? baseDiscountInvoiced;
  num? baseDiscountTaxCompensationAmount;
  num? baseOriginalPrice;
  num? basePrice;
  num? basePriceInclTax;
  num? baseRowInvoiced;
  num? baseRowTotal;
  num? baseRowTotalInclTax;
  num? baseTaxAmount;
  num? baseTaxInvoiced;
  String? createdAt;
  num? discountAmount;
  num? discountInvoiced;
  num? discountPercent;
  num? freeShipping;
  num? discountTaxCompensationAmount;
  num? isQtyDecimal;
  num? isVirtual;
  num? itemId;
  String? name;
  num? noDiscount;
  num? orderId;
  num? originalPrice;
  num? price;
  num? priceInclTax;
  num? productId;
  String? productType;
  num? qtyCanceled;
  num? qtyInvoiced;
  num? qtyOrdered;
  num? qtyRefunded;
  num? qtyShipped;
  num? quoteItemId;
  num? rowInvoiced;
  num? rowTotal;
  num? rowTotalInclTax;
  num? rowWeight;
  String? sku;
  num? storeId;
  num? taxAmount;
  num? taxInvoiced;
  num? taxPercent;
  String? updatedAt;
  num? weight;
  ExtensionAttributes? extensionAttributes;

  OrderItem({
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
    this.extensionAttributes,
  });

  factory OrderItem.fromMap(Map<String, dynamic> data) => OrderItem(
        amountRefunded: data['amount_refunded'] as num?,
        baseAmountRefunded: data['base_amount_refunded'] as num?,
        baseCost: (data['base_cost'] as num?)?.toDouble(),
        baseDiscountAmount: data['base_discount_amount'] as num?,
        baseDiscountInvoiced: data['base_discount_invoiced'] as num?,
        baseDiscountTaxCompensationAmount:
            data['base_discount_tax_compensation_amount'] as num?,
        baseOriginalPrice: data['base_original_price'] as num?,
        basePrice: data['base_price'] as num?,
        basePriceInclTax: data['base_price_incl_tax'] as num?,
        baseRowInvoiced: data['base_row_invoiced'] as num?,
        baseRowTotal: data['base_row_total'] as num?,
        baseRowTotalInclTax: data['base_row_total_incl_tax'] as num?,
        baseTaxAmount: data['base_tax_amount'] as num?,
        baseTaxInvoiced: data['base_tax_invoiced'] as num?,
        createdAt: data['created_at'] as String?,
        discountAmount: data['discount_amount'] as num?,
        discountInvoiced: data['discount_invoiced'] as num?,
        discountPercent: data['discount_percent'] as num?,
        freeShipping: data['free_shipping'] as num?,
        discountTaxCompensationAmount:
            data['discount_tax_compensation_amount'] as num?,
        isQtyDecimal: data['is_qty_decimal'] as num?,
        isVirtual: data['is_virtual'] as num?,
        itemId: data['item_id'] as num?,
        name: data['name'] as String?,
        noDiscount: data['no_discount'] as num?,
        orderId: data['order_id'] as num?,
        originalPrice: data['original_price'] as num?,
        price: data['price'] as num?,
        priceInclTax: data['price_incl_tax'] as num?,
        productId: data['product_id'] as num?,
        productType: data['product_type'] as String?,
        qtyCanceled: data['qty_canceled'] as num?,
        qtyInvoiced: data['qty_invoiced'] as num?,
        qtyOrdered: data['qty_ordered'] as num?,
        qtyRefunded: data['qty_refunded'] as num?,
        qtyShipped: data['qty_shipped'] as num?,
        quoteItemId: data['quote_item_id'] as num?,
        rowInvoiced: data['row_invoiced'] as num?,
        rowTotal: data['row_total'] as num?,
        rowTotalInclTax: data['row_total_incl_tax'] as num?,
        rowWeight: data['row_weight'] as num?,
        sku: data['sku'] as String?,
        storeId: data['store_id'] as num?,
        taxAmount: data['tax_amount'] as num?,
        taxInvoiced: data['tax_invoiced'] as num?,
        taxPercent: data['tax_percent'] as num?,
        updatedAt: data['updated_at'] as String?,
        weight: data['weight'] as num?,
        extensionAttributes: data['extension_attributes'] == null
            ? null
            : ExtensionAttributes.fromMap(
                data['extension_attributes'] as Map<String, dynamic>),
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
        'extension_attributes': extensionAttributes?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderItem].
  factory OrderItem.fromJson(String data) {
    return OrderItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderItem] to a JSON string.
  String toJson() => json.encode(toMap());
}
