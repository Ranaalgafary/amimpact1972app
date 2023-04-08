import 'dart:convert';

import 'result.dart';

class HomeModel {
  int? success;
  String? messageEn;
  String? messageAr;
  Result? result;

  HomeModel({this.success, this.messageEn, this.messageAr, this.result});

  factory HomeModel.fromMap(Map<String, dynamic> data) => HomeModel(
        success: data['success'] as int?,
        messageEn: data['message_en'] as String?,
        messageAr: data['message_ar'] as String?,
        result: data['result'] == null
            ? null
            : Result.fromMap(data['result'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'message_en': messageEn,
        'message_ar': messageAr,
        'result': result?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HomeModel].
  factory HomeModel.fromJson(String data) {
    return HomeModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HomeModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
