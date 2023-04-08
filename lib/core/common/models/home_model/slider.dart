import 'dart:convert';

class Slider {
  String? sliderId;
  String? sliderName;
  String? sliderImg;
  String? path;
  String? type;

  Slider({
    this.sliderId,
    this.sliderName,
    this.sliderImg,
    this.path,
    this.type,
  });

  factory Slider.fromMap(Map<String, dynamic> data) => Slider(
        sliderId: data['slider_id'] as String?,
        sliderName: data['slider_name'] as String?,
        sliderImg: data['slider_img'] as String?,
        path: data['path'] as String?,
        type: data['type'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'slider_id': sliderId,
        'slider_name': sliderName,
        'slider_img': sliderImg,
        'path': path,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Slider].
  factory Slider.fromJson(String data) {
    return Slider.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Slider] to a JSON string.
  String toJson() => json.encode(toMap());
}
