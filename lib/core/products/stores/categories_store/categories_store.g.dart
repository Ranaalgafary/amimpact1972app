// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesStore on CategoriesStoreBase, Store {
  late final _$categoriesModelAtom =
      Atom(name: 'CategoriesStoreBase.categoriesModel', context: context);

  @override
  CategoriesModel? get categoriesModel {
    _$categoriesModelAtom.reportRead();
    return super.categoriesModel;
  }

  @override
  set categoriesModel(CategoriesModel? value) {
    _$categoriesModelAtom.reportWrite(value, super.categoriesModel, () {
      super.categoriesModel = value;
    });
  }

  late final _$subCategoriesModelAtom =
      Atom(name: 'CategoriesStoreBase.subCategoriesModel', context: context);

  @override
  CategoriesModel? get subCategoriesModel {
    _$subCategoriesModelAtom.reportRead();
    return super.subCategoriesModel;
  }

  @override
  set subCategoriesModel(CategoriesModel? value) {
    _$subCategoriesModelAtom.reportWrite(value, super.subCategoriesModel, () {
      super.subCategoriesModel = value;
    });
  }

  late final _$subSubCategoriesModelAtom =
      Atom(name: 'CategoriesStoreBase.subSubCategoriesModel', context: context);

  @override
  CategoriesModel? get subSubCategoriesModel {
    _$subSubCategoriesModelAtom.reportRead();
    return super.subSubCategoriesModel;
  }

  @override
  set subSubCategoriesModel(CategoriesModel? value) {
    _$subSubCategoriesModelAtom.reportWrite(value, super.subSubCategoriesModel,
        () {
      super.subSubCategoriesModel = value;
    });
  }

  late final _$selectedCategoryIdAtom =
      Atom(name: 'CategoriesStoreBase.selectedCategoryId', context: context);

  @override
  String? get selectedCategoryId {
    _$selectedCategoryIdAtom.reportRead();
    return super.selectedCategoryId;
  }

  @override
  set selectedCategoryId(String? value) {
    _$selectedCategoryIdAtom.reportWrite(value, super.selectedCategoryId, () {
      super.selectedCategoryId = value;
    });
  }

  late final _$productsPathAtom =
      Atom(name: 'CategoriesStoreBase.productsPath', context: context);

  @override
  String? get productsPath {
    _$productsPathAtom.reportRead();
    return super.productsPath;
  }

  @override
  set productsPath(String? value) {
    _$productsPathAtom.reportWrite(value, super.productsPath, () {
      super.productsPath = value;
    });
  }

  late final _$selectedSubCategoryIdAtom =
      Atom(name: 'CategoriesStoreBase.selectedSubCategoryId', context: context);

  @override
  String? get selectedSubCategoryId {
    _$selectedSubCategoryIdAtom.reportRead();
    return super.selectedSubCategoryId;
  }

  @override
  set selectedSubCategoryId(String? value) {
    _$selectedSubCategoryIdAtom.reportWrite(value, super.selectedSubCategoryId,
        () {
      super.selectedSubCategoryId = value;
    });
  }

  late final _$selectedSubSubCategoryIdAtom = Atom(
      name: 'CategoriesStoreBase.selectedSubSubCategoryId', context: context);

  @override
  String? get selectedSubSubCategoryId {
    _$selectedSubSubCategoryIdAtom.reportRead();
    return super.selectedSubSubCategoryId;
  }

  @override
  set selectedSubSubCategoryId(String? value) {
    _$selectedSubSubCategoryIdAtom
        .reportWrite(value, super.selectedSubSubCategoryId, () {
      super.selectedSubSubCategoryId = value;
    });
  }

  @override
  String toString() {
    return '''
categoriesModel: ${categoriesModel},
subCategoriesModel: ${subCategoriesModel},
subSubCategoriesModel: ${subSubCategoriesModel},
selectedCategoryId: ${selectedCategoryId},
productsPath: ${productsPath},
selectedSubCategoryId: ${selectedSubCategoryId},
selectedSubSubCategoryId: ${selectedSubSubCategoryId}
    ''';
  }
}
