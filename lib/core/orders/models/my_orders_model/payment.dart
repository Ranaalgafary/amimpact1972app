import 'dart:convert';

class Payment {
  dynamic accountStatus;
  List<String>? additionalInformation;
  int? amountOrdered;
  int? baseAmountOrdered;
  int? baseShippingAmount;
  String? ccExpYear;
  dynamic ccLast4;
  String? ccSsStartMonth;
  String? ccSsStartYear;
  int? entityId;
  String? method;
  int? parentId;
  int? shippingAmount;

  Payment({
    this.accountStatus,
    this.additionalInformation,
    this.amountOrdered,
    this.baseAmountOrdered,
    this.baseShippingAmount,
    this.ccExpYear,
    this.ccLast4,
    this.ccSsStartMonth,
    this.ccSsStartYear,
    this.entityId,
    this.method,
    this.parentId,
    this.shippingAmount,
  });

  factory Payment.fromMap(Map<String, dynamic> data) => Payment(
        accountStatus: data['account_status'] as dynamic,
        additionalInformation:
            (data['additional_information'] as List).cast<String>(),
        amountOrdered: data['amount_ordered'] as int?,
        baseAmountOrdered: data['base_amount_ordered'] as int?,
        baseShippingAmount: data['base_shipping_amount'] as int?,
        ccExpYear: data['cc_exp_year'] as String?,
        ccLast4: data['cc_last4'] as dynamic,
        ccSsStartMonth: data['cc_ss_start_month'] as String?,
        ccSsStartYear: data['cc_ss_start_year'] as String?,
        entityId: data['entity_id'] as int?,
        method: data['method'] as String?,
        parentId: data['parent_id'] as int?,
        shippingAmount: data['shipping_amount'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'account_status': accountStatus,
        'additional_information': additionalInformation,
        'amount_ordered': amountOrdered,
        'base_amount_ordered': baseAmountOrdered,
        'base_shipping_amount': baseShippingAmount,
        'cc_exp_year': ccExpYear,
        'cc_last4': ccLast4,
        'cc_ss_start_month': ccSsStartMonth,
        'cc_ss_start_year': ccSsStartYear,
        'entity_id': entityId,
        'method': method,
        'parent_id': parentId,
        'shipping_amount': shippingAmount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Payment].
  factory Payment.fromJson(String data) {
    return Payment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Payment] to a JSON string.
  String toJson() => json.encode(toMap());
}
