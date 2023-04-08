import 'dart:convert';

class ExtensionAttributes {
  bool? isSubscribed;

  ExtensionAttributes({this.isSubscribed});

  factory ExtensionAttributes.fromMap(Map<String, dynamic> data) {
    return ExtensionAttributes(
      isSubscribed: data['is_subscribed'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'is_subscribed': isSubscribed,
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
