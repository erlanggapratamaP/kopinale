import 'dart:convert';

import 'query.dart';
import 'city.dart';
import 'status.dart';

class Rajaongkir {
  Query? query;
  Status? status;
  List<City>? city;

  Rajaongkir({this.query, this.status, this.city});

  @override
  String toString() {
    return 'Rajaongkir(query: $query, status: $status, results: $city)';
  }

  factory Rajaongkir.fromMap(Map<String, dynamic> data) => Rajaongkir(
        query: data['query'] == null
            ? null
            : Query.fromMap(data['query'] as Map<String, dynamic>),
        status: data['status'] == null
            ? null
            : Status.fromMap(data['status'] as Map<String, dynamic>),
        city: (data['results'] as List<dynamic>?)
            ?.map((e) => City.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'query': query?.toMap(),
        'status': status?.toMap(),
        'results': city?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Rajaongkir].
  factory Rajaongkir.fromJson(String data) {
    return Rajaongkir.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Rajaongkir] to a JSON string.
  String toJson() => json.encode(toMap());

  Rajaongkir copyWith({
    Query? query,
    Status? status,
    List<City>? results,
  }) {
    return Rajaongkir(
      query: query ?? this.query,
      status: status ?? this.status,
      city: results ?? this.city,
    );
  }
}
