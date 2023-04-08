import 'package:amimpact/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  late final SharedPreferences _prefs;

  Future<void> setSharedPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setEmail(String email) => _prefs.setString(kEmailKey, email);
  String get email => _prefs.getString(kEmailKey) ?? "";

  Future<void> setPassword(String password) => _prefs.setString(
        kPasswordKey,
        password,
      );
  String get password => _prefs.getString(kPasswordKey) ?? "";

  set loginType(String loginType) => _prefs.setString(kLoginTypeKey, loginType);
  String get loginType => _prefs.getString(kLoginTypeKey) ?? "";
}
