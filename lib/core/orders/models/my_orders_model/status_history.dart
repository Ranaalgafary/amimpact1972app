import 'dart:convert';

class StatusHistory {
  String? comment;
  String? createdAt;
  int? entityId;
  String? entityName;
  dynamic isCustomerNotified;
  int? isVisibleOnFront;
  int? parentId;
  String? status;

  StatusHistory({
    this.comment,
    this.createdAt,
    this.entityId,
    this.entityName,
    this.isCustomerNotified,
    this.isVisibleOnFront,
    this.parentId,
    this.status,
  });

  factory StatusHistory.fromMap(Map<String, dynamic> data) => StatusHistory(
        comment: data['comment'] as String?,
        createdAt: data['created_at'] as String?,
        entityId: data['entity_id'] as int?,
        entityName: data['entity_name'] as String?,
        isCustomerNotified: data['is_customer_notified'] as dynamic,
        isVisibleOnFront: data['is_visible_on_front'] as int?,
        parentId: data['parent_id'] as int?,
        status: data['status'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'comment': comment,
        'created_at': createdAt,
        'entity_id': entityId,
        'entity_name': entityName,
        'is_customer_notified': isCustomerNotified,
        'is_visible_on_front': isVisibleOnFront,
        'parent_id': parentId,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StatusHistory].
  factory StatusHistory.fromJson(String data) {
    return StatusHistory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StatusHistory] to a JSON string.
  String toJson() => json.encode(toMap());
}
