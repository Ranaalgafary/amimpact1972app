import 'dart:convert';

import '../../../account/models/user_model.dart';

class LoginModel {
  int? success;
  String? token;
  UserModel? info;

  LoginModel({this.success, this.token, this.info});

  factory LoginModel.fromMap(Map<String, dynamic> data) => LoginModel(
        success: data['success'] as int?,
        token: data['token'] as String?,
        info: data['info'] == null
            ? null
            : UserModel.fromMap(data['info'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'token': token,
        'info': info?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginModel].
  factory LoginModel.fromJson(String data) {
    return LoginModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
