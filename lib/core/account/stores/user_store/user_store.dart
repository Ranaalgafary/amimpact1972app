import 'package:amimpact/enums/view_state.dart';
import 'package:dio/dio.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @observable
  String firstName = "";
  @observable
  String lastName = "";
  @observable
  String email = "";
  @observable
  String phoneNumber = "";
  @observable
  String password = "";
  @observable
  String confirmPassword = "";
  @observable
  String? errorMessage;

  @observable
  bool obsecureText = true;

  @observable
  ViewState viewState = ViewState.idle;

  @action
  Future loginWithEmail() async {
    viewState = ViewState.loading;
    errorMessage = null;
    await Future.delayed(const Duration(seconds: 3));
    try {
      // final res = await locator<Apis>().loginWithEmail(email, password);
    } on DioError catch (e) {
      errorMessage = e.error.toString();
    }
    viewState = ViewState.idle;
  }

  @action
  Future register() async {
    viewState = ViewState.loading;
    errorMessage = null;
    await Future.delayed(const Duration(seconds: 3));

    try {
      // final res = await locator<Apis>().loginWithEmail(email, password);
    } on DioError catch (e) {
      errorMessage = e.error.toString();
    }
    viewState = ViewState.idle;
  }

  @action
  Future<bool> forgotPassword() async {
    viewState = ViewState.loading;
    errorMessage = null;
    await Future.delayed(const Duration(seconds: 1));
    try {
      // final res = await locator<Apis>().loginWithEmail(email, password);
      viewState = ViewState.idle;
      return true;
    } on DioError catch (e) {
      errorMessage = e.error.toString();
      viewState = ViewState.idle;

      return false;
    }
  }

  @action
  Future<bool> loginWithGoogle() async {
    // errorMessage = null;

    // viewState = ViewState.loading;
    // final _googleSignIn = GoogleSignIn(
    //   scopes: [
    //     'email',
    //   ],
    // );
    // try {
    //   final res = await _googleSignIn.signIn();
    // } catch (_) {}
    // viewState = ViewState.idle;

    return true;
  }
}
