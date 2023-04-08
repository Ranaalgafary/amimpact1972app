import 'dart:convert';

class BillingAddress {
  int? id;
  dynamic region;
  dynamic regionId;
  dynamic regionCode;
  dynamic countryId;
  List<String>? street;
  dynamic telephone;
  dynamic postcode;
  dynamic city;
  dynamic firstname;
  dynamic lastname;
  int? customerId;
  String? email;
  int? sameAsBilling;
  int? saveInAddressBook;

  BillingAddress({
    this.id,
    this.region,
    this.regionId,
    this.regionCode,
    this.countryId,
    this.street,
    this.telephone,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.customerId,
    this.email,
    this.sameAsBilling,
    this.saveInAddressBook,
  });

  factory BillingAddress.fromMap(Map<String, dynamic> data) {
    return BillingAddress(
      id: data['id'] as int?,
      region: data['region'] as dynamic,
      regionId: data['region_id'] as dynamic,
      regionCode: data['region_code'] as dynamic,
      countryId: data['country_id'] as dynamic,
      street: data['street'] as List<String>?,
      telephone: data['telephone'] as dynamic,
      postcode: data['postcode'] as dynamic,
      city: data['city'] as dynamic,
      firstname: data['firstname'] as dynamic,
      lastname: data['lastname'] as dynamic,
      customerId: data['customer_id'] as int?,
      email: data['email'] as String?,
      sameAsBilling: data['same_as_billing'] as int?,
      saveInAddressBook: data['save_in_address_book'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'region': region,
        'region_id': regionId,
        'region_code': regionCode,
        'country_id': countryId,
        'street': street,
        'telephone': telephone,
        'postcode': postcode,
        'city': city,
        'firstname': firstname,
        'lastname': lastname,
        'customer_id': customerId,
        'email': email,
        'same_as_billing': sameAsBilling,
        'save_in_address_book': saveInAddressBook,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BillingAddress].
  factory BillingAddress.fromJson(String data) {
    return BillingAddress.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BillingAddress] to a JSON string.
  String toJson() => json.encode(toMap());
}
