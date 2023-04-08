// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckoutStore on CheckoutStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: 'CheckoutStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$addressAtom =
      Atom(name: 'CheckoutStoreBase.address', context: context);

  @override
  Address? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$shippingMethodsAtom =
      Atom(name: 'CheckoutStoreBase.shippingMethods', context: context);

  @override
  List<ShippingMethod>? get shippingMethods {
    _$shippingMethodsAtom.reportRead();
    return super.shippingMethods;
  }

  @override
  set shippingMethods(List<ShippingMethod>? value) {
    _$shippingMethodsAtom.reportWrite(value, super.shippingMethods, () {
      super.shippingMethods = value;
    });
  }

  late final _$fileAtom =
      Atom(name: 'CheckoutStoreBase.file', context: context);

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$pickedShippingMethodAtom =
      Atom(name: 'CheckoutStoreBase.pickedShippingMethod', context: context);

  @override
  ShippingMethod? get pickedShippingMethod {
    _$pickedShippingMethodAtom.reportRead();
    return super.pickedShippingMethod;
  }

  @override
  set pickedShippingMethod(ShippingMethod? value) {
    _$pickedShippingMethodAtom.reportWrite(value, super.pickedShippingMethod,
        () {
      super.pickedShippingMethod = value;
    });
  }

  late final _$paymentMethodsModelAtom =
      Atom(name: 'CheckoutStoreBase.paymentMethodsModel', context: context);

  @override
  PaymentMethodsModel? get paymentMethodsModel {
    _$paymentMethodsModelAtom.reportRead();
    return super.paymentMethodsModel;
  }

  @override
  set paymentMethodsModel(PaymentMethodsModel? value) {
    _$paymentMethodsModelAtom.reportWrite(value, super.paymentMethodsModel, () {
      super.paymentMethodsModel = value;
    });
  }

  late final _$paymentMethodsAtom =
      Atom(name: 'CheckoutStoreBase.paymentMethods', context: context);

  @override
  PaymentMethodsModel? get paymentMethods {
    _$paymentMethodsAtom.reportRead();
    return super.paymentMethods;
  }

  @override
  set paymentMethods(PaymentMethodsModel? value) {
    _$paymentMethodsAtom.reportWrite(value, super.paymentMethods, () {
      super.paymentMethods = value;
    });
  }

  late final _$pickedPaymentMethodAtom =
      Atom(name: 'CheckoutStoreBase.pickedPaymentMethod', context: context);

  @override
  PaymentMethod? get pickedPaymentMethod {
    _$pickedPaymentMethodAtom.reportRead();
    return super.pickedPaymentMethod;
  }

  @override
  set pickedPaymentMethod(PaymentMethod? value) {
    _$pickedPaymentMethodAtom.reportWrite(value, super.pickedPaymentMethod, () {
      super.pickedPaymentMethod = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
address: ${address},
shippingMethods: ${shippingMethods},
file: ${file},
pickedShippingMethod: ${pickedShippingMethod},
paymentMethodsModel: ${paymentMethodsModel},
paymentMethods: ${paymentMethods},
pickedPaymentMethod: ${pickedPaymentMethod}
    ''';
  }
}
