import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/models/login_model/login_model.dart';
import 'package:amimpact/core/common/stores/init_store/init_store.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/auth_service.dart';
import 'package:amimpact/utils/prefs.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  Future init() async {
    final userName = locator<Prefs>().email;
    final password = locator<Prefs>().password;
    if (userName.isNotEmpty && password.isNotEmpty) {
      final res = await locator<AuthService>().login(
        userName,
        password,
      );
      if (res is LoginModel) {
        locator<AccountStore>().token = res.token;
        locator<AccountStore>().user = res.info;
        locator<InitStore>().onLogin();
      }
    }
  }

  Future onLogin(LoginModel model, {String? email, String? password}) async {
    saveUserCred(email, password);
    locator<AccountStore>().token = model.token;
    locator<AccountStore>().user = model.info;
    locator<AuthService>().addUserFcmToken();

    locator<InitStore>().onLogin();
  }

  Future<void> saveUserCred(String? email, String? password) async {
    await locator<Prefs>().setEmail(email ?? "");
    await locator<Prefs>().setPassword(password ?? "");
  }
}
