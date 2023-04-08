// ignore_for_file: avoid_dynamic_calls

import 'package:amimpact/core/account/models/balance_history_model/balance_history_model.dart';
import 'package:amimpact/core/account/models/notifications_model/notifications_model.dart';
import 'package:amimpact/core/account/models/user_model.dart';
import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/models/login_model/login_model.dart';
import 'package:amimpact/core/products/models/reviews_model/review_model.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_helper.dart';
import 'package:fcm_config/fcm_config.dart';

class AuthService {
  final _dio = locator<NetworkHelper>().dio;

  Future login(String username, String password) async {
    try {
      final res = await _dio
          .post("login", data: {"user_name": username, "password": password});
      if (res.data["info"] != null) {
        return LoginModel.fromMap(res.data as Map<String, dynamic>);
      }

      return res.data["message"];
    } catch (_) {
      return "هناك خطأ ما";
    }
  }

  Future forgotPassword(String email) async {
    try {
      final res = await _dio.post("forgot_password", data: {"email": email});
      if (res.data["message"] is bool) {
        return true;
      } else {
        return res.data["message"]["message"];
      }
    } catch (_) {
      return "هناك خطأ ما";
    }
  }

  Future changePassword(String current, String newPassword) async {
    try {
      final res = await _dio.post(
        "change_password",
        data: {
          "currentPassword": current,
          "newPassword": newPassword,
          "customerId": locator<AccountStore>().user?.id
        },
      );
      if (res is bool) {
        return true;
      } else {
        return res.data["message"];
      }
    } catch (_) {
      return "هناك خطأ ما";
    }
  }

  Future registerWithEmail(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber}) async {
    try {
      final res = await _dio.post(
        "register",
        data: {
          "firstname": firstName,
          "lastname": lastName,
          "email": email,
          "regionCode": 0,
          "regionId": 0,
          "region": "aa",
          "countryId": "SA",
          "city": "aa",
          "street": "aa",
          "telephone": phoneNumber,
          "password": password
        },
      );
      if (res.data["message"] == null) {
        return true;
      }

      return res.data["message"];
    } catch (_) {
      return "هناك خطأ ما";
    }
  }

  Future<List<ReviewModel>> getReviews() async {
    try {
      final res = await _dio.post(
        "get_customer_reviews",
        data: {"customerId": locator<AccountStore>().user?.id},
      );
      return (res.data as List<dynamic>?)
              ?.map((e) => ReviewModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [];
    } catch (_) {
      return [];
    }
  }

  Future<int> getBalance() async {
    try {
      final res = await _dio.post(
        "customer_store_credit",
        data: {
          "token": locator<AccountStore>().token,
        },
      );
      return res.data["store_credit"] as int? ?? 0;
    } catch (_) {
      return 0;
    }
  }

  Future<BalanceHistoryModel?> getBalanceHistory() async {
    try {
      final res = await _dio.post(
        "customer_store_credit_history",
        data: {
          "customer_id": locator<AccountStore>().user!.id,
        },
      );
      return BalanceHistoryModel.fromMap(res.data as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future updateProfile(
      {required String firstName,
      required String lastName,
      required bool subscribed}) async {
    try {
      final res = await _dio.post(
        "edit_profile",
        data: {
          "firstname": firstName,
          "lastname": lastName,
          "email": locator<AccountStore>().user?.email,
          "customerId": locator<AccountStore>().user?.id,
          "subscribed": "${subscribed}"
        },
      );
      if (res.data["message"] == null) {
        return true;
      }

      return res.data["message"];
    } catch (_) {
      return "هناك خطأ ما";
    }
  }

  Future addUserFcmToken() async {
    try {
      final token = await FCMConfig.instance.messaging.getToken();
      await _dio.post(
        "add_update_token",
        data: {"customer_id": locator<AccountStore>().user!.id, "token": token},
      );
    } catch (_) {
      return null;
    }
  }

  Future<NotificationsModel?> getNotifications() async {
    try {
      final res = await _dio.post(
        "get_notifications",
        data: {
          "customer_id": locator<AccountStore>().user?.id ?? 0,
        },
      );
      return NotificationsModel.fromJson(res.data as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future deleteAccount() async {
    try {
      final res = await _dio.post(
        "delete_customer",
        data: {
          "customerId": locator<AccountStore>().user?.id,
        },
      );
      if (res.data.toString() == "true") {
        return true;
      }

      return res.data["message"];
    } catch (_) {
      return "هناك خطأ ما";
    }
  }
}
