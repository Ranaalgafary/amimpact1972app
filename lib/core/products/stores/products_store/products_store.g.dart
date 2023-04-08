// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsStore on ProductsStoreBase, Store {
  late final _$modelAtom =
      Atom(name: 'ProductsStoreBase.model', context: context);

  @override
  ProductsModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ProductsModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$productsAtom =
      Atom(name: 'ProductsStoreBase.products', context: context);

  @override
  ObservableList<ProductsModelData> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductsModelData> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$gettingMoreDataAtom =
      Atom(name: 'ProductsStoreBase.gettingMoreData', context: context);

  @override
  bool get gettingMoreData {
    _$gettingMoreDataAtom.reportRead();
    return super.gettingMoreData;
  }

  @override
  set gettingMoreData(bool value) {
    _$gettingMoreDataAtom.reportWrite(value, super.gettingMoreData, () {
      super.gettingMoreData = value;
    });
  }

  @override
  String toString() {
    return '''
model: ${model},
products: ${products},
gettingMoreData: ${gettingMoreData}
    ''';
  }
}
