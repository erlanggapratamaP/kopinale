import 'dart:convert';

import 'rajaongkir.dart';

class ProvienceResponseModel {
  Rajaongkir? rajaongkir;

  ProvienceResponseModel({this.rajaongkir});

  @override
  String toString() => 'ProvienceResponseModel(rajaongkir: $rajaongkir)';

  factory ProvienceResponseModel.fromMap(Map<String, dynamic> data) {
    return ProvienceResponseModel(
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
  /// Parses the string and returns the resulting Json object as [ProvienceResponseModel].
  factory ProvienceResponseModel.fromJson(String data) {
    return ProvienceResponseModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProvienceResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ProvienceResponseModel copyWith({
    Rajaongkir? rajaongkir,
  }) {
    return ProvienceResponseModel(
      rajaongkir: rajaongkir ?? this.rajaongkir,
    );
  }
}
