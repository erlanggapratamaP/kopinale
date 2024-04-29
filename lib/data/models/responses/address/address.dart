import 'dart:convert';

class Address {
  int? id;
  String? name;
  String? fullAddress;
  String? phone;
  String? provId;
  String? cityId;
  String? districtId;
  String? postalCode;
  int? userId;
  int? isDefault;
  String? createdAt;
  String? updatedAt;

  Address({
    this.id,
    this.name,
    this.fullAddress,
    this.phone,
    this.provId,
    this.cityId,
    this.districtId,
    this.postalCode,
    this.userId,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Datum(id: $id, name: $name, fullAddress: $fullAddress, phone: $phone, provId: $provId, cityId: $cityId, districtId: $districtId, postalCode: $postalCode, userId: $userId, isDefault: $isDefault, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Address.fromMap(Map<String, dynamic> data) => Address(
        id: data['id'] as int?,
        name: data['name'] as String?,
        fullAddress: data['full_address'] as String?,
        phone: data['phone'] as String?,
        provId: data['prov_id'] as String?,
        cityId: data['city_id'] as String?,
        districtId: data['district_id'] as String?,
        postalCode: data['postal_code'] as String?,
        userId: data['user_id'] as int?,
        isDefault: data['is_default'] as int?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'full_address': fullAddress,
        'phone': phone,
        'prov_id': provId,
        'city_id': cityId,
        'district_id': districtId,
        'postal_code': postalCode,
        'user_id': userId,
        'is_default': isDefault,
        'created_at': createdAt,
        'updated_at': updatedAt,
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

  Address copyWith({
    int? id,
    String? name,
    String? fullAddress,
    String? phone,
    String? provId,
    String? cityId,
    String? districtId,
    String? postalCode,
    int? userId,
    int? isDefault,
    String? createdAt,
    String? updatedAt,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      fullAddress: fullAddress ?? this.fullAddress,
      phone: phone ?? this.phone,
      provId: provId ?? this.provId,
      cityId: cityId ?? this.cityId,
      districtId: districtId ?? this.districtId,
      postalCode: postalCode ?? this.postalCode,
      userId: userId ?? this.userId,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
