import 'dart:convert';

import 'provience.dart';
import 'status.dart';

class Rajaongkir {
  List<dynamic>? query;
  Status? status;
  List<Provience>? provience;

  Rajaongkir({this.query, this.status, this.provience});

  @override
  String toString() {
    return 'Rajaongkir(query: $query, status: $status, results: $provience)';
  }

  factory Rajaongkir.fromMap(Map<String, dynamic> data) => Rajaongkir(
        query: data['query'] as List<dynamic>?,
        status: data['status'] == null
            ? null
            : Status.fromMap(data['status'] as Map<String, dynamic>),
        provience: (data['results'] as List<dynamic>?)
            ?.map((e) => Provience.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'query': query,
        'status': status?.toMap(),
        'results': provience?.map((e) => e.toMap()).toList(),
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
    List<dynamic>? query,
    Status? status,
    List<Provience>? results,
  }) {
    return Rajaongkir(
      query: query ?? this.query,
      status: status ?? this.status,
      provience: results ?? this.provience,
    );
  }
}
