import 'dart:convert';

class Address {
  String? addressType;
  String? city;
  String? countryId;
  String? email;
  int? entityId;
  String? firstname;
  String? lastname;
  int? parentId;
  dynamic postcode;
  String? region;
  String? regionCode;
  int? regionId;
  List<String>? street;
  String? telephone;

  Address({
    this.addressType,
    this.city,
    this.countryId,
    this.email,
    this.entityId,
    this.firstname,
    this.lastname,
    this.parentId,
    this.postcode,
    this.region,
    this.regionCode,
    this.regionId,
    this.street,
    this.telephone,
  });

  factory Address.fromMap(Map<String, dynamic> data) => Address(
        addressType: data['address_type'] as String?,
        city: data['city'] as String?,
        countryId: data['country_id'] as String?,
        email: data['email'] as String?,
        entityId: data['entity_id'] as int?,
        firstname: data['firstname'] as String?,
        lastname: data['lastname'] as String?,
        parentId: data['parent_id'] as int?,
        postcode: data['postcode'] as dynamic,
        region: data['region'] as String?,
        regionCode: data['region_code'] as String?,
        regionId: data['region_id'] as int?,
        street: (data['street'] as List?)?.cast<String>(),
        telephone: data['telephone'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'address_type': addressType,
        'city': city,
        'country_id': countryId,
        'email': email,
        'entity_id': entityId,
        'firstname': firstname,
        'lastname': lastname,
        'parent_id': parentId,
        'postcode': postcode,
        'region': region,
        'region_code': regionCode,
        'region_id': regionId,
        'street': street,
        'telephone': telephone,
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
