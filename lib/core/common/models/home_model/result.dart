// ignore_for_file: always_use_package_imports

import 'dart:convert';

import 'banner.dart';
import 'new_offers_special.dart';
import 'section.dart';
import 'slider.dart';

class Result {
  List<Slider>? slider;
  List<NewOffersSpecial>? newOffersSpecial;
  List<HomeBanner>? banners;
  List<Section>? sections;

  Result({this.slider, this.newOffersSpecial, this.banners, this.sections});

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        slider: (data['slider'] as List<dynamic>?)
            ?.map((e) => Slider.fromMap(e as Map<String, dynamic>))
            .toList(),
        newOffersSpecial: (data['new_offers_special'] as List<dynamic>?)
            ?.map((e) => NewOffersSpecial.fromMap(e as Map<String, dynamic>))
            .toList(),
        banners: (data['banners'] as List<dynamic>?)
            ?.map((e) => HomeBanner.fromMap(e as Map<String, dynamic>))
            .toList(),
        sections: (data['sections'] as List<dynamic>?)
            ?.map((e) => Section.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'slider': slider?.map((e) => e.toMap()).toList(),
        'new_offers_special': newOffersSpecial?.map((e) => e.toMap()).toList(),
        'banners': banners?.map((e) => e.toMap()).toList(),
        'sections': sections?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());
}
