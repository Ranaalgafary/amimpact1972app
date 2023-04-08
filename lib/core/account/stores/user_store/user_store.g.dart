// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$firstNameAtom =
      Atom(name: 'UserStoreBase.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: 'UserStoreBase.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$emailAtom = Atom(name: 'UserStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$phoneNumberAtom =
      Atom(name: 'UserStoreBase.phoneNumber', context: context);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'UserStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'UserStoreBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'UserStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$obsecureTextAtom =
      Atom(name: 'UserStoreBase.obsecureText', context: context);

  @override
  bool get obsecureText {
    _$obsecureTextAtom.reportRead();
    return super.obsecureText;
  }

  @override
  set obsecureText(bool value) {
    _$obsecureTextAtom.reportWrite(value, super.obsecureText, () {
      super.obsecureText = value;
    });
  }

  late final _$viewStateAtom =
      Atom(name: 'UserStoreBase.viewState', context: context);

  @override
  ViewState get viewState {
    _$viewStateAtom.reportRead();
    return super.viewState;
  }

  @override
  set viewState(ViewState value) {
    _$viewStateAtom.reportWrite(value, super.viewState, () {
      super.viewState = value;
    });
  }

  late final _$loginWithEmailAsyncAction =
      AsyncAction('UserStoreBase.loginWithEmail', context: context);

  @override
  Future<dynamic> loginWithEmail() {
    return _$loginWithEmailAsyncAction.run(() => super.loginWithEmail());
  }

  late final _$registerAsyncAction =
      AsyncAction('UserStoreBase.register', context: context);

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$forgotPasswordAsyncAction =
      AsyncAction('UserStoreBase.forgotPassword', context: context);

  @override
  Future<bool> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  late final _$loginWithGoogleAsyncAction =
      AsyncAction('UserStoreBase.loginWithGoogle', context: context);

  @override
  Future<bool> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
email: ${email},
phoneNumber: ${phoneNumber},
password: ${password},
confirmPassword: ${confirmPassword},
errorMessage: ${errorMessage},
obsecureText: ${obsecureText},
viewState: ${viewState}
    ''';
  }
}
