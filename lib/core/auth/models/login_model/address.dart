import 'dart:convert';

import 'custom_attribute.dart';
import 'region.dart';

class Address {
  int? id;
  int? customerId;
  Region? region;
  int? regionId;
  String? countryId;
  List<String>? street;
  String? telephone;
  String? city;
  String? firstname;
  String? lastname;
  bool? defaultShipping;
  bool? defaultBilling;
  List<CustomAttribute>? customAttributes;

  Address({
    this.id,
    this.customerId,
    this.region,
    this.regionId,
    this.countryId,
    this.street,
    this.telephone,
    this.city,
    this.firstname,
    this.lastname,
    this.defaultShipping,
    this.defaultBilling,
    this.customAttributes,
  });

  factory Address.fromMap(Map<String, dynamic> data) => Address(
        id: data['id'] as int?,
        customerId: data['customer_id'] as int?,
        region: data['region'] == null
            ? null
            : Region.fromMap(data['region'] as Map<String, dynamic>),
        regionId: data['region_id'] as int?,
        countryId: data['country_id'] as String?,
        street: (data['street'] == null ? [] : data['street'] as List<dynamic>)
            .map((e) => e.toString())
            .toList(),
        telephone: data['telephone'] as String?,
        city: data['city'] as String?,
        firstname: data['firstname'] as String?,
        lastname: data['lastname'] as String?,
        defaultShipping: data['default_shipping'] as bool?,
        defaultBilling: data['default_billing'] as bool?,
        customAttributes: (data['custom_attributes'] as List<dynamic>?)
            ?.map((e) => CustomAttribute.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'customer_id': customerId,
        'region': region?.toMap(),
        'region_id': regionId,
        'country_id': countryId,
        'street': street,
        'telephone': telephone,
        'city': city,
        'firstname': firstname,
        'lastname': lastname,
        'default_shipping': defaultShipping,
        'default_billing': defaultBilling,
        'custom_attributes': customAttributes?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());
}
