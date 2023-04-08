import 'dart:convert';

class NewOffersSpecial {
  String? sId;
  String? name;
  String? image;
  String? path;

  NewOffersSpecial({this.sId, this.name, this.image, this.path});

  factory NewOffersSpecial.fromMap(Map<String, dynamic> data) {
    return NewOffersSpecial(
      sId: data['s_id'] as String?,
      name: data['name'] as String?,
      image: data['image'] as String?,
      path: data['path'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        's_id': sId,
        'name': name,
        'image': image,
        'path': path,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NewOffersSpecial].
  factory NewOffersSpecial.fromJson(String data) {
    return NewOffersSpecial.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NewOffersSpecial] to a JSON string.
  String toJson() => json.encode(toMap());
}
