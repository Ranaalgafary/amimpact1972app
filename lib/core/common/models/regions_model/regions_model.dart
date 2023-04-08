import 'dart:convert';

import 'result.dart';

class RegionsModel {
  int? success;
  String? messageEn;
  String? messageAr;
  List<RegionModel>? result;

  RegionsModel({this.success, this.messageEn, this.messageAr, this.result});

  factory RegionsModel.fromMap(Map<String, dynamic> data) => RegionsModel(
        success: data['success'] as int?,
        messageEn: data['message_en'] as String?,
        messageAr: data['message_ar'] as String?,
        result: (data['result'] as List<dynamic>?)
            ?.map((e) => RegionModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'message_en': messageEn,
        'message_ar': messageAr,
        'result': result?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegionsModel].
  factory RegionsModel.fromJson(String data) {
    return RegionsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RegionsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
