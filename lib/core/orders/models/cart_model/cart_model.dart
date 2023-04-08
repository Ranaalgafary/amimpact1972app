import 'dart:convert';

import 'billing_address.dart';
import 'currency.dart';
import 'extension_attributes.dart';
import 'item.dart';

class CartModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  bool? isActive;
  bool? isVirtual;
  List<CartItem>? items;
  int? itemsCount;
  int? itemsQty;

  int? origOrderId;
  Currency? currency;
  bool? customerIsGuest;
  bool? customerNoteNotify;
  int? customerTaxClassId;
  int? storeId;

  CartModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.isVirtual,
    this.items,
    this.itemsCount,
    this.itemsQty,
    this.origOrderId,
    this.currency,
    this.customerIsGuest,
    this.customerNoteNotify,
    this.customerTaxClassId,
    this.storeId,
  });

  factory CartModel.fromMap(Map<String, dynamic> data) => CartModel(
        id: data['id'] as int?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        isActive: data['is_active'] as bool?,
        isVirtual: data['is_virtual'] as bool?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromMap(e as Map<String, dynamic>))
            .toList(),
        itemsCount: data['items_count'] as int?,
        itemsQty: data['items_qty'] as int?,
        origOrderId: data['orig_order_id'] as int?,
        currency: data['currency'] == null
            ? null
            : Currency.fromMap(data['currency'] as Map<String, dynamic>),
        customerIsGuest: data['customer_is_guest'] as bool?,
        customerNoteNotify: data['customer_note_notify'] as bool?,
        customerTaxClassId: data['customer_tax_class_id'] as int?,
        storeId: data['store_id'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'is_active': isActive,
        'is_virtual': isVirtual,
        'items': items?.map((e) => e.toMap()).toList(),
        'items_count': itemsCount,
        'items_qty': itemsQty,
        'orig_order_id': origOrderId,
        'currency': currency?.toMap(),
        'customer_is_guest': customerIsGuest,
        'customer_note_notify': customerNoteNotify,
        'customer_tax_class_id': customerTaxClassId,
        'store_id': storeId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CartModel].
  factory CartModel.fromJson(String data) {
    return CartModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CartModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
