import 'result.dart';

class NotificationsModel {
  int? success;
  String? messageEn;
  String? messageAr;
  List<Result>? result;

  NotificationsModel({
    this.success,
    this.messageEn,
    this.messageAr,
    this.result,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      success: json['success'] as int?,
      messageEn: json['message_en'] as String?,
      messageAr: json['message_ar'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message_en': messageEn,
        'message_ar': messageAr,
        'result': result?.map((e) => e.toJson()).toList(),
      };
}
