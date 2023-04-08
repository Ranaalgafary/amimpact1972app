import 'dart:convert';

import 'result.dart';

class CategoriesModel {
  int? success;
  String? messageEn;
  String? messageAr;
  List<CategoriesResult>? result;
  Map<String, dynamic>? filters;

  CategoriesModel({
    this.success,
    this.messageEn,
    this.messageAr,
    this.filters,
    this.result,
  });

  factory CategoriesModel.fromMap(Map<String, dynamic> data) {
    return CategoriesModel(
      success: data['success'] as int?,
      messageEn: data['message_en'] as String?,
      messageAr: data['message_ar'] as String?,
      filters: data['filter']?['availablefilter'] as Map<String, dynamic>?,
      result: (data['result'] as List<dynamic>?)
          ?.map((e) => CategoriesResult.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'success': success,
        'message_en': messageEn,
        'message_ar': messageAr,
        'result': result?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoriesModel].
  factory CategoriesModel.fromJson(String data) {
    return CategoriesModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoriesModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
