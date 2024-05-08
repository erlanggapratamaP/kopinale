import 'dart:convert';

import 'rajaongkir.dart';

class CityResponseModel {
  Rajaongkir? rajaongkir;

  CityResponseModel({this.rajaongkir});

  @override
  String toString() => 'CityResponseModel(rajaongkir: $rajaongkir)';

  factory CityResponseModel.fromMap(Map<String, dynamic> data) {
    return CityResponseModel(
      rajaongkir: data['rajaongkir'] == null
          ? null
          : Rajaongkir.fromMap(data['rajaongkir'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'rajaongkir': rajaongkir?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CityResponseModel].
  factory CityResponseModel.fromJson(String data) {
    return CityResponseModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CityResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CityResponseModel copyWith({
    Rajaongkir? rajaongkir,
  }) {
    return CityResponseModel(
      rajaongkir: rajaongkir ?? this.rajaongkir,
    );
  }
}
