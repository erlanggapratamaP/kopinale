// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressRequestModel {
  final String? name;
  final String? fullAddress;
  final String? phone;
  final String? provId;
  final String? stringId;
  final String? cityId;
  final String? districtId;
  final String? postalCode;
  final int? userId;
  final int? isDefault;

  AddressRequestModel({
    this.name,
    this.fullAddress,
    this.phone,
    this.provId,
    this.stringId,
    this.cityId,
    this.districtId,
    this.postalCode,
    this.userId,
    this.isDefault,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'fullAddress': fullAddress,
      'phone': phone,
      'provId': provId,
      'stringId': stringId,
      'cityId': cityId,
      'districtId': districtId,
      'postalCode': postalCode,
      'userId': userId,
      'isDefault': isDefault,
    };
  }

  factory AddressRequestModel.fromMap(Map<String, dynamic> map) {
    return AddressRequestModel(
      name: map['name'] != null ? map['name'] as String : null,
      fullAddress:
          map['fullAddress'] != null ? map['fullAddress'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      provId: map['provId'] != null ? map['provId'] as String : null,
      stringId: map['stringId'] != null ? map['stringId'] as String : null,
      cityId: map['cityId'] != null ? map['cityId'] as String : null,
      districtId:
          map['districtId'] != null ? map['districtId'] as String : null,
      postalCode:
          map['postalCode'] != null ? map['postalCode'] as String : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      isDefault: map['isDefault'] != null ? map['isDefault'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressRequestModel.fromJson(String source) =>
      AddressRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
