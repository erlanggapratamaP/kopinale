import 'dart:convert';

class City {
  String? cityId;
  String? provinceId;
  String? province;
  String? type;
  String? cityName;
  String? postalCode;

  City({
    this.cityId,
    this.provinceId,
    this.province,
    this.type,
    this.cityName,
    this.postalCode,
  });

  @override
  String toString() {
    return 'Result(cityId: $cityId, provinceId: $provinceId, province: $province, type: $type, cityName: $cityName, postalCode: $postalCode)';
  }

  factory City.fromMap(Map<String, dynamic> data) => City(
        cityId: data['city_id'] as String?,
        provinceId: data['province_id'] as String?,
        province: data['province'] as String?,
        type: data['type'] as String?,
        cityName: data['city_name'] as String?,
        postalCode: data['postal_code'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'city_id': cityId,
        'province_id': provinceId,
        'province': province,
        'type': type,
        'city_name': cityName,
        'postal_code': postalCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [City].
  factory City.fromJson(String data) {
    return City.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [City] to a JSON string.
  String toJson() => json.encode(toMap());

  City copyWith({
    String? cityId,
    String? provinceId,
    String? province,
    String? type,
    String? cityName,
    String? postalCode,
  }) {
    return City(
      cityId: cityId ?? this.cityId,
      provinceId: provinceId ?? this.provinceId,
      province: province ?? this.province,
      type: type ?? this.type,
      cityName: cityName ?? this.cityName,
      postalCode: postalCode ?? this.postalCode,
    );
  }
}
