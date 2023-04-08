// ignore_for_file: always_use_package_imports

import 'dart:convert';

import 'products.dart';

class Section {
  String? sectionId;
  String? sectionName;
  String? sectionPath;
  String? sectionPosition;
  String? path;
  HomeProducts? products;

  Section({
    this.sectionId,
    this.sectionName,
    this.sectionPath,
    this.sectionPosition,
    this.path,
    this.products,
  });

  factory Section.fromMap(Map<String, dynamic> data) => Section(
        sectionId: data['section_id'] as String?,
        sectionName: data['section_name'] as String?,
        sectionPath: data['section_path'] as String?,
        sectionPosition: data['section_position'] as String?,
        path: data['path'] as String?,
        products: data['products'] == null
            ? null
            : HomeProducts.fromMap(data['products'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'section_id': sectionId,
        'section_name': sectionName,
        'section_path': sectionPath,
        'section_position': sectionPosition,
        'path': path,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Section].
  factory Section.fromJson(String data) {
    return Section.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Section] to a JSON string.
  String toJson() => json.encode(toMap());
}
