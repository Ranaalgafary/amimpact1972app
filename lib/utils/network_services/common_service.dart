import 'dart:developer';

import 'package:amimpact/core/account/stores/account_store/account_store.dart';
import 'package:amimpact/core/auth/models/login_model/address.dart';
import 'package:amimpact/core/common/models/categories_model/categories_model.dart';
import 'package:amimpact/core/common/models/home_model/home_model.dart';
import 'package:amimpact/core/common/models/regions_model/regions_model.dart';
import 'package:amimpact/core/common/models/regions_model/result.dart';
import 'package:amimpact/utils/locator.dart';
import 'package:amimpact/utils/network_helper.dart';
import 'package:flutter/material.dart';

class CommonService {
  final _dio = locator<NetworkHelper>().dio;

  Future<HomeModel?> getHomeData() async {
    try {
      final res = await _dio.post("get_home_data");
      return HomeModel.fromMap(res.data as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<CategoriesModel?> getCategories({String? catId}) async {
    try {
      final res = await _dio.post(
        "get_categories",
        data: {"category_id": catId},
      );
      return CategoriesModel.fromMap(res.data as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<List<RegionModel>?> getRegions() async {
    try {
      final res = await _dio.post("get_regions_cities");
      return (res.data as List<dynamic>?)
          ?.map((e) => RegionModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return null;
    }
  }

  Future addAddress(
      {required RegionModel region,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String city,
      required String address}) async {
    try {
      final res = await _dio.post("add_address", data: {
        "customerId": locator<AccountStore>().user?.id,
        "firstname": firstName,
        "lastname": lastName,
        "region_code": region.code,
        "region_id": region.regionId,
        "region": region.defaultName,
        "country_id": "SA",
        "city": city,
        "street": address,
        "telephone": phoneNumber
      });
      if (res.data["message"] == null) {
        return true;
      }
      return res.data["message"];
    } catch (_) {
      return "فشلت العملية";
    }
  }
}
