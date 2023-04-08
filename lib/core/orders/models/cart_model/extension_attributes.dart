import 'dart:convert';

class ExtensionAttributes {
  String? imageUrl;

  ExtensionAttributes({this.imageUrl});

  factory ExtensionAttributes.fromMap(Map<String, dynamic> data) {
    return ExtensionAttributes(
      imageUrl: data['image_url'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'image_url': imageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExtensionAttributes].
  factory ExtensionAttributes.fromJson(String data) {
    return ExtensionAttributes.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExtensionAttributes] to a JSON string.
  String toJson() => json.encode(toMap());
}
