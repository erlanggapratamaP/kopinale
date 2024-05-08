import 'dart:convert';

class Provience {
  String? provinceId;
  String? province;

  Provience({this.provinceId, this.province});

  @override
  String toString() {
    return '$province';
  }

  factory Provience.fromMap(Map<String, dynamic> data) => Provience(
        provinceId: data['province_id'] as String?,
        province: data['province'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'province_id': provinceId,
        'province': province,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Provience].
  factory Provience.fromJson(String data) {
    return Provience.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Provience] to a JSON string.
  String toJson() => json.encode(toMap());

  Provience copyWith({
    String? provinceId,
    String? province,
  }) {
    return Provience(
      provinceId: provinceId ?? this.provinceId,
      province: province ?? this.province,
    );
  }
}
