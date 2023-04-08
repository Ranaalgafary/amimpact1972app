import 'dart:convert';

class Item {
  String? historyId;
  String? customerHistoryId;
  String? customerId;
  String? isDeduct;
  String? difference;
  String? storeCreditBalance;
  String? action;
  String? actionData;
  String? message;
  String? createdAt;
  String? storeId;

  Item({
    this.historyId,
    this.customerHistoryId,
    this.customerId,
    this.isDeduct,
    this.difference,
    this.storeCreditBalance,
    this.action,
    this.actionData,
    this.message,
    this.createdAt,
    this.storeId,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        historyId: data['history_id'] as String?,
        customerHistoryId: data['customer_history_id'] as String?,
        customerId: data['customer_id'] as String?,
        isDeduct: data['is_deduct'] as String?,
        difference: data['difference'] as String?,
        storeCreditBalance: data['store_credit_balance'] as String?,
        action: data['action'] as String?,
        actionData: data['action_data'] as String?,
        message: data['message'] as String?,
        createdAt: data['created_at'] as String?,
        storeId: data['store_id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'history_id': historyId,
        'customer_history_id': customerHistoryId,
        'customer_id': customerId,
        'is_deduct': isDeduct,
        'difference': difference,
        'store_credit_balance': storeCreditBalance,
        'action': action,
        'action_data': actionData,
        'message': message,
        'created_at': createdAt,
        'store_id': storeId,
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
