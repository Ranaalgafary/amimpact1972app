import 'dart:convert';

class RegionModel {
  String? regionId;
  String? countryId;
  String? code;
  String? defaultName;
  List<String>? cities;

  RegionModel(
      {this.cities,
      this.regionId,
      this.countryId,
      this.code,
      this.defaultName});

  factory RegionModel.fromMap(Map<String, dynamic> data) {
    return RegionModel(
      regionId: data['region_id'] as String?,
      countryId: data['country_id'] as String?,
      code: data['region_code'] as String?,
      defaultName: data['name'] as String?,
      cities: List<String>.from((data["cities"] as List).map((x) => x)),
    );
  }

  Map<String, dynamic> toMap() => {
        'region_id': regionId,
        'country_id': countryId,
        'code': code,
        'default_name': defaultName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegionModel].
  factory RegionModel.fromJson(String data) {
    return RegionModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RegionModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
