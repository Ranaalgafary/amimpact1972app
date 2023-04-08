// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_dynamic_calls

import 'package:amimpact/core/common/models/categories_model/categories_model.dart';
import 'package:amimpact/core/common/models/categories_model/result.dart';
import 'package:amimpact/models/category_model.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_services/common_service.dart';
import 'package:mobx/mobx.dart';
part 'categories_store.g.dart';

class CategoriesStore = CategoriesStoreBase with _$CategoriesStore;

abstract class CategoriesStoreBase with Store {
  @observable
  CategoriesModel? categoriesModel;
  CategoriesResult? mainSubCategory;
  CategoriesResult? mainSubSubCategory;

  @observable
  CategoriesModel? subCategoriesModel;
  @observable
  CategoriesModel? subSubCategoriesModel;

  Future init() async {
    await Future.wait([getCategories()]);
  }

  @observable
  String? selectedCategoryId;

  @observable
  String? productsPath;

  @observable
  String? selectedSubCategoryId;

  @observable
  String? selectedSubSubCategoryId;

  Map<String, dynamic>? filters;

  void selectCategory(CategoriesResult category) {
    dispose();
    selectedCategoryId = category.categoryId;
    productsPath = category.path;
    getSubCategories();
  }

  void selectSubCategory(CategoriesResult category, int index) {
    selectedSubCategoryId = category.categoryId;
    subSubCategoriesModel = null;

    productsPath = category.path;
    if (index != 0) {
      getSubSubCategories();
    } else {
      subSubCategoriesModel = null;
    }
  }

  void selectSubSubCategory(CategoriesResult category) {
    selectedSubSubCategoryId = category.categoryId;
    productsPath = category.path;
  }

  Future getCategories() async {
    categoriesModel = await locator<CommonService>().getCategories();
    filters = categoriesModel?.filters;
  }

  Future getSubCategories() async {
    mainSubCategory = categoriesModel?.result
        ?.singleWhere((element) => element.categoryId == selectedCategoryId);
    subCategoriesModel =
        await locator<CommonService>().getCategories(catId: selectedCategoryId);
    subCategoriesModel?.result?.insert(
      0,
      CategoriesResult()
        ..parentId = mainSubCategory?.parentId
        ..path = mainSubCategory?.path
        ..name = "الكل"
        ..categoryId = "-2",
    );
    filters = subCategoriesModel?.filters;
  }

  Future getSubSubCategories() async {
    mainSubSubCategory = subCategoriesModel?.result?.singleWhere(
      (element) => element.categoryId == selectedSubCategoryId,
    );

    subSubCategoriesModel = await locator<CommonService>()
        .getCategories(catId: selectedSubCategoryId)
      ?..result?.insert(
          0,
          CategoriesResult()
            ..parentId = mainSubSubCategory?.parentId
            ..path = mainSubSubCategory?.path
            ..name = "الكل"
            ..categoryId = "-2");

    filters = subSubCategoriesModel?.filters;
  }

  bool hasFilters() {
    bool hasValue = false;
    filters?.keys.forEach((element) {
      if (filters?[element]["value"]?["value"] != null) {
        hasValue = true;
      }
    });
    return hasValue;
  }

  void dispose() {
    filters = null;
    selectedCategoryId = null;
    selectedSubCategoryId = null;
    selectedSubSubCategoryId = null;
    mainSubCategory = null;
    mainSubSubCategory = null;
    subCategoriesModel = null;
    subSubCategoriesModel = null;
    subCategoriesModel?.result
        ?.removeWhere((element) => element.name == "الكل");
    subSubCategoriesModel?.result
        ?.removeWhere((element) => element.name == "الكل");
  }
}
