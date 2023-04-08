import 'dart:convert';

import '../../auth/models/login_model/address.dart';
import '../../auth/models/login_model/custom_attribute.dart';
import '../../auth/models/login_model/extension_attributes.dart';

class UserModel {
  int? id;
  int? groupId;
  String? defaultBilling;
  String? defaultShipping;
  String? createdAt;
  String? updatedAt;
  String? createdIn;
  String? email;
  String? firstname;
  String? lastname;
  int? storeId;
  int? websiteId;
  List<Address>? addresses;
  int? disableAutoGroupChange;
  ExtensionAttributes? extensionAttributes;
  List<CustomAttribute>? customAttributes;

  UserModel({
    this.id,
    this.groupId,
    this.defaultBilling,
    this.defaultShipping,
    this.createdAt,
    this.updatedAt,
    this.createdIn,
    this.email,
    this.firstname,
    this.lastname,
    this.storeId,
    this.websiteId,
    this.addresses,
    this.disableAutoGroupChange,
    this.extensionAttributes,
    this.customAttributes,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        id: data['id'] as int?,
        groupId: data['group_id'] as int?,
        // defaultBilling: data['default_billing'] as String?,
        // defaultShipping: data['default_shipping'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        createdIn: data['created_in'] as String?,
        email: data['email'] as String?,
        firstname: data['firstname'] as String?,
        lastname: data['lastname'] as String?,
        // storeId: data['store_id'] as int?,
        // websiteId: data['website_id'] as int?,
        addresses: data['addresses'] == null
            ? null
            : (data['addresses'] as List<dynamic>?)
                ?.map((e) => Address.fromMap(e as Map<String, dynamic>))
                .toList(),
        // disableAutoGroupChange: data['disable_auto_group_change'] as int?,
        extensionAttributes: data['extension_attributes'] == null
            ? null
            : ExtensionAttributes.fromMap(
                data['extension_attributes'] as Map<String, dynamic>),
        // customAttributes: (data['custom_attributes'] as List<dynamic>?)
        //     ?.map((e) => CustomAttribute.fromMap(e as Map<String, dynamic>))
        //     .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'group_id': groupId,
        'default_billing': defaultBilling,
        'default_shipping': defaultShipping,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'created_in': createdIn,
        'email': email,
        'firstname': firstname,
        'lastname': lastname,
        'store_id': storeId,
        'website_id': websiteId,
        'addresses': addresses?.map((e) => e.toMap()).toList(),
        'disable_auto_group_change': disableAutoGroupChange,
        'extension_attributes': extensionAttributes?.toMap(),
        'custom_attributes': customAttributes?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
