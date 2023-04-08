import 'dart:convert';

import 'billing_address.dart';
import 'extension_attributes.dart';
import 'order_item.dart';
import 'payment.dart';
import 'status_history.dart';

class Order {
  String? baseCurrencyCode;
  num? baseDiscountAmount;
  num? baseGrandTotal;
  num? baseDiscountTaxCompensationAmount;
  num? baseShippingAmount;
  num? baseShippingDiscountAmount;
  num? baseShippingDiscountTaxCompensationAmnt;
  num? baseShippingInclTax;
  num? baseShippingTaxAmount;
  num? baseSubtotal;
  num? baseSubtotalInclTax;
  num? baseTaxAmount;
  num? baseTotalDue;
  num? baseToGlobalRate;
  num? baseToOrderRate;
  num? billingAddressId;
  String? createdAt;
  String? customerEmail;
  String? customerFirstname;
  num? customerGroupId;
  num? customerId;
  num? customerIsGuest;
  String? customerLastname;
  num? customerNoteNotify;
  num? discountAmount;
  num? entityId;
  String? globalCurrencyCode;
  num? grandTotal;
  num? discountTaxCompensationAmount;
  String? incrementId;
  num? isVirtual;
  String? orderCurrencyCode;
  String? protectCode;
  num? quoteId;
  String? remoteIp;
  num? shippingAmount;
  String? shippingDescription;
  num? shippingDiscountAmount;
  num? shippingDiscountTaxCompensationAmount;
  num? shippingInclTax;
  num? shippingTaxAmount;
  String? state;
  String? status;
  String? storeCurrencyCode;
  num? storeId;
  String? storeName;
  num? storeToBaseRate;
  num? storeToOrderRate;
  num? subtotal;
  num? subtotalInclTax;
  num? taxAmount;
  num? totalDue;
  num? totalItemCount;
  num? totalQtyOrdered;
  String? updatedAt;
  num? weight;
  String? xForwardedFor;
  List<OrderItem>? orderItems;
  BillingAddress? billingAddress;
  Payment? payment;
  List<StatusHistory>? statusHistories;
  ExtensionAttributes? extensionAttributes;

  Order({
    this.baseCurrencyCode,
    this.baseDiscountAmount,
    this.baseGrandTotal,
    this.baseDiscountTaxCompensationAmount,
    this.baseShippingAmount,
    this.baseShippingDiscountAmount,
    this.baseShippingDiscountTaxCompensationAmnt,
    this.baseShippingInclTax,
    this.baseShippingTaxAmount,
    this.baseSubtotal,
    this.baseSubtotalInclTax,
    this.baseTaxAmount,
    this.baseTotalDue,
    this.baseToGlobalRate,
    this.baseToOrderRate,
    this.billingAddressId,
    this.createdAt,
    this.customerEmail,
    this.customerFirstname,
    this.customerGroupId,
    this.customerId,
    this.customerIsGuest,
    this.customerLastname,
    this.customerNoteNotify,
    this.discountAmount,
    this.entityId,
    this.globalCurrencyCode,
    this.grandTotal,
    this.discountTaxCompensationAmount,
    this.incrementId,
    this.isVirtual,
    this.orderCurrencyCode,
    this.protectCode,
    this.quoteId,
    this.remoteIp,
    this.shippingAmount,
    this.shippingDescription,
    this.shippingDiscountAmount,
    this.shippingDiscountTaxCompensationAmount,
    this.shippingInclTax,
    this.shippingTaxAmount,
    this.state,
    this.status,
    this.storeCurrencyCode,
    this.storeId,
    this.storeName,
    this.storeToBaseRate,
    this.storeToOrderRate,
    this.subtotal,
    this.subtotalInclTax,
    this.taxAmount,
    this.totalDue,
    this.totalItemCount,
    this.totalQtyOrdered,
    this.updatedAt,
    this.weight,
    this.xForwardedFor,
    this.orderItems,
    this.billingAddress,
    this.payment,
    this.statusHistories,
    this.extensionAttributes,
  });

  factory Order.fromMap(Map<String, dynamic> data) => Order(
        baseCurrencyCode: data['base_currency_code'] as String?,
        baseDiscountAmount: data['base_discount_amount'] as num?,
        baseGrandTotal: data['base_grand_total'] as num?,
        baseDiscountTaxCompensationAmount:
            data['base_discount_tax_compensation_amount'] as num?,
        baseShippingAmount: data['base_shipping_amount'] as num?,
        baseShippingDiscountAmount:
            data['base_shipping_discount_amount'] as num?,
        baseShippingDiscountTaxCompensationAmnt:
            data['base_shipping_discount_tax_compensation_amnt'] as num?,
        baseShippingInclTax: data['base_shipping_incl_tax'] as num?,
        baseShippingTaxAmount: data['base_shipping_tax_amount'] as num?,
        baseSubtotal: data['base_subtotal'] as num?,
        baseSubtotalInclTax: data['base_subtotal_incl_tax'] as num?,
        baseTaxAmount: data['base_tax_amount'] as num?,
        baseTotalDue: data['base_total_due'] as num?,
        baseToGlobalRate: data['base_to_global_rate'] as num?,
        baseToOrderRate: data['base_to_order_rate'] as num?,
        billingAddressId: data['billing_address_id'] as num?,
        createdAt: data['created_at'] as String?,
        customerEmail: data['customer_email'] as String?,
        customerFirstname: data['customer_firstname'] as String?,
        customerGroupId: data['customer_group_id'] as num?,
        customerId: data['customer_id'] as num?,
        customerIsGuest: data['customer_is_guest'] as num?,
        customerLastname: data['customer_lastname'] as String?,
        customerNoteNotify: data['customer_note_notify'] as num?,
        discountAmount: data['discount_amount'] as num?,
        entityId: data['entity_id'] as num?,
        globalCurrencyCode: data['global_currency_code'] as String?,
        grandTotal: data['grand_total'] as num?,
        discountTaxCompensationAmount:
            data['discount_tax_compensation_amount'] as num?,
        incrementId: data['increment_id'] as String?,
        isVirtual: data['is_virtual'] as num?,
        orderCurrencyCode: data['order_currency_code'] as String?,
        protectCode: data['protect_code'] as String?,
        quoteId: data['quote_id'] as num?,
        remoteIp: data['remote_ip'] as String?,
        shippingAmount: data['shipping_amount'] as num?,
        shippingDescription: data['shipping_description'] as String?,
        shippingDiscountAmount: data['shipping_discount_amount'] as num?,
        shippingDiscountTaxCompensationAmount:
            data['shipping_discount_tax_compensation_amount'] as num?,
        shippingInclTax: data['shipping_incl_tax'] as num?,
        shippingTaxAmount: data['shipping_tax_amount'] as num?,
        state: data['state'] as String?,
        status: data['status'] as String?,
        storeCurrencyCode: data['store_currency_code'] as String?,
        storeId: data['store_id'] as num?,
        storeName: data['store_name'] as String?,
        storeToBaseRate: data['store_to_base_rate'] as num?,
        storeToOrderRate: data['store_to_order_rate'] as num?,
        subtotal: data['subtotal'] as num?,
        subtotalInclTax: data['subtotal_incl_tax'] as num?,
        taxAmount: data['tax_amount'] as num?,
        totalDue: data['total_due'] as num?,
        totalItemCount: data['total_item_count'] as num?,
        totalQtyOrdered: data['total_qty_ordered'] as num?,
        updatedAt: data['updated_at'] as String?,
        weight: data['weight'] as num?,
        xForwardedFor: data['x_forwarded_for'] as String?,
        orderItems: (data['items'] as List<dynamic>?)
            ?.map((e) => OrderItem.fromMap(e as Map<String, dynamic>))
            .toList(),
        billingAddress: data['billing_address'] == null
            ? null
            : BillingAddress.fromMap(
                data['billing_address'] as Map<String, dynamic>),
        payment: data['payment'] == null
            ? null
            : Payment.fromMap(data['payment'] as Map<String, dynamic>),
        statusHistories: (data['status_histories'] as List<dynamic>?)
            ?.map((e) => StatusHistory.fromMap(e as Map<String, dynamic>))
            .toList(),
        extensionAttributes: data['extension_attributes'] == null
            ? null
            : ExtensionAttributes.fromMap(
                data['extension_attributes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'base_currency_code': baseCurrencyCode,
        'base_discount_amount': baseDiscountAmount,
        'base_grand_total': baseGrandTotal,
        'base_discount_tax_compensation_amount':
            baseDiscountTaxCompensationAmount,
        'base_shipping_amount': baseShippingAmount,
        'base_shipping_discount_amount': baseShippingDiscountAmount,
        'base_shipping_discount_tax_compensation_amnt':
            baseShippingDiscountTaxCompensationAmnt,
        'base_shipping_incl_tax': baseShippingInclTax,
        'base_shipping_tax_amount': baseShippingTaxAmount,
        'base_subtotal': baseSubtotal,
        'base_subtotal_incl_tax': baseSubtotalInclTax,
        'base_tax_amount': baseTaxAmount,
        'base_total_due': baseTotalDue,
        'base_to_global_rate': baseToGlobalRate,
        'base_to_order_rate': baseToOrderRate,
        'billing_address_id': billingAddressId,
        'created_at': createdAt,
        'customer_email': customerEmail,
        'customer_firstname': customerFirstname,
        'customer_group_id': customerGroupId,
        'customer_id': customerId,
        'customer_is_guest': customerIsGuest,
        'customer_lastname': customerLastname,
        'customer_note_notify': customerNoteNotify,
        'discount_amount': discountAmount,
        'entity_id': entityId,
        'global_currency_code': globalCurrencyCode,
        'grand_total': grandTotal,
        'discount_tax_compensation_amount': discountTaxCompensationAmount,
        'increment_id': incrementId,
        'is_virtual': isVirtual,
        'order_currency_code': orderCurrencyCode,
        'protect_code': protectCode,
        'quote_id': quoteId,
        'remote_ip': remoteIp,
        'shipping_amount': shippingAmount,
        'shipping_description': shippingDescription,
        'shipping_discount_amount': shippingDiscountAmount,
        'shipping_discount_tax_compensation_amount':
            shippingDiscountTaxCompensationAmount,
        'shipping_incl_tax': shippingInclTax,
        'shipping_tax_amount': shippingTaxAmount,
        'state': state,
        'status': status,
        'store_currency_code': storeCurrencyCode,
        'store_id': storeId,
        'store_name': storeName,
        'store_to_base_rate': storeToBaseRate,
        'store_to_order_rate': storeToOrderRate,
        'subtotal': subtotal,
        'subtotal_incl_tax': subtotalInclTax,
        'tax_amount': taxAmount,
        'total_due': totalDue,
        'total_item_count': totalItemCount,
        'total_qty_ordered': totalQtyOrdered,
        'updated_at': updatedAt,
        'weight': weight,
        'x_forwarded_for': xForwardedFor,
        'items': orderItems?.map((e) => e.toMap()).toList(),
        'billing_address': billingAddress?.toMap(),
        'payment': payment?.toMap(),
        'status_histories': statusHistories?.map((e) => e.toMap()).toList(),
        'extension_attributes': extensionAttributes?.toMap(),
      };

  String getStatus() {
    switch (status?.toLowerCase()) {
      case "canceled":
        return "ملغي";
      case "pending":
        return "معلق";
      case "complete":
        return "تم الشحن";
      case "processing":
        return "جاري المراجعة";
      default:
        return status ?? "";
    }
  }

  String getShippingName(String key) {
    final Map<String, String> map = {
      "2aitocrates": "سمسا",
      "12aitocrates": "زاجل",
      "10aitocrates": "أي مكان",
    };
    return map[key] ?? key;
  }

  String getPaymentMethod(String key) {
    final Map<String, String> map = {
      "HyperPay_Mada": "بطاقة مدى البنكية",
      "HyperPay_Master": "ماستر كارد",
      "HyperPay_Visa": "فيزا",
      "HyperPay_stc": "STCPAY",
      "HyperPay_ApplePay": "ApplePay",
      "phoenix_bankpayment": "تحويل بنكي",
      "cashondelivery": "الدفع عند الإستلام"
    };
    return map[key] ?? key;
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Order].
  factory Order.fromJson(String data) {
    return Order.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Order] to a JSON string.
  String toJson() => json.encode(toMap());
}
