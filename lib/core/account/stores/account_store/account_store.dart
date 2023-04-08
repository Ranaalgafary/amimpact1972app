import 'package:amimpact/core/account/models/user_model.dart';
import 'package:amimpact/core/auth/stores/auth_store/auth_store.dart';
import 'package:amimpact/core/common/stores/init_store/init_store.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:mobx/mobx.dart';

part 'account_store.g.dart';

class AccountStore = _AccountStoreBase with _$AccountStore;

abstract class _AccountStoreBase with Store {
  @observable
  String? token;

  @observable
  UserModel? user;

  bool isLoggedIn() => token != null;

  void logout() {
    token = null;
    user = null;
    locator<InitStore>().onLogout();
  }
}
