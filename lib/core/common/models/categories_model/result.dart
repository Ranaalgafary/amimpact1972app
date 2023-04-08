import 'dart:convert';

class CategoriesResult {
  String? categoryId;
  String? parentId;
  String? name;
  String? image;
  String? path;

  CategoriesResult({
    this.categoryId,
    this.parentId,
    this.name,
    this.image,
    this.path,
  });

  factory CategoriesResult.fromMap(Map<String, dynamic> data) =>
      CategoriesResult(
          categoryId: data['category_id'] as String?,
          parentId: data['parent_id'] as String?,
          name: data['name'] as String?,
          image: data['image'] as String?,
          path: data['path'] as String?);

  Map<String, dynamic> toMap() => {
        'category_id': categoryId,
        'parent_id': parentId,
        'name': name,
        'image': image,
        'path': path,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the CategoriesResulting Json object as [CategoriesResult].
  factory CategoriesResult.fromJson(String data) {
    return CategoriesResult.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoriesResult] to a JSON string.
  String toJson() => json.encode(toMap());
}
