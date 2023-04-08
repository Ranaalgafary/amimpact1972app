import 'dart:convert';

class ReviewModel {
  int? id;
  String? createdAt;
  int? entityId;
  int? entityPkValue;
  int? statusId;
  int? detailId;
  String? title;
  String? detail;
  String? nickname;
  int? mpBprHelpful;
  String? avgValue;

  ReviewModel({
    this.id,
    this.createdAt,
    this.entityId,
    this.entityPkValue,
    this.statusId,
    this.detailId,
    this.title,
    this.detail,
    this.nickname,
    this.mpBprHelpful,
    this.avgValue,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> data) => ReviewModel(
        id: data['id'] as int?,
        createdAt: data['created_at'] as String?,
        entityId: data['entity_id'] as int?,
        entityPkValue: data['entity_pk_value'] as int?,
        statusId: data['status_id'] as int?,
        detailId: data['detail_id'] as int?,
        title: data['title'] as String?,
        detail: data['detail'] as String?,
        nickname: data['nickname'] as String?,
        mpBprHelpful: data['mp_bpr_helpful'] as int?,
        avgValue: data['avg_value'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'created_at': createdAt,
        'entity_id': entityId,
        'entity_pk_value': entityPkValue,
        'status_id': statusId,
        'detail_id': detailId,
        'title': title,
        'detail': detail,
        'nickname': nickname,
        'mp_bpr_helpful': mpBprHelpful,
        'avg_value': avgValue,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ReviewModel].
  factory ReviewModel.fromJson(String data) {
    return ReviewModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ReviewModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
