import 'dart:convert';

class HomeBanner {
  String? bannerId;
  String? bannerName;
  String? bannerImg;
  String? bannerPosition;
  String? path;
  String? type;
  String? sectionId;
  String? size;

  HomeBanner({
    this.bannerId,
    this.bannerName,
    this.bannerImg,
    this.bannerPosition,
    this.path,
    this.type,
    this.sectionId,
    this.size,
  });

  factory HomeBanner.fromMap(Map<String, dynamic> data) => HomeBanner(
      bannerId: data['banner_id'] as String?,
      bannerName: data['banner_name'] as String?,
      bannerImg: data['banner_img'] as String?,
      bannerPosition: data['banner_position'] as String?,
      path: data['path'] as String?,
      type: data['type'] as String?,
      size: data['size'] as String?,
      sectionId: data["section_id"] as String?);

  Map<String, dynamic> toMap() => {
        'banner_id': bannerId,
        'banner_name': bannerName,
        'banner_img': bannerImg,
        'banner_position': bannerPosition,
        'path': path,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Banner].
  factory HomeBanner.fromJson(String data) {
    return HomeBanner.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Banner] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return "banners are $bannerPosition - $sectionId - $size";
  }
}
