import 'dart:convert';

class Region {
  dynamic regionCode;
  String? region;
  int? regionId;

  Region({this.regionCode, this.region, this.regionId});

  factory Region.fromMap(Map<String, dynamic> data) => Region(
        regionCode: data['region_code'] as dynamic,
        region: data['region'] as String?,
        regionId: data['region_id'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'region_code': regionCode,
        'region': region,
        'region_id': regionId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Region].
  factory Region.fromJson(String data) {
    return Region.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Region] to a JSON string.
  String toJson() => json.encode(toMap());
}
