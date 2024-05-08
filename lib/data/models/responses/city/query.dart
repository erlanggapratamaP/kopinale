import 'dart:convert';

class Query {
  String? provience;

  Query({this.provience});

  @override
  String toString() => 'Query(provience: $provience)';

  factory Query.fromMap(Map<String, dynamic> data) => Query(
        provience: data['provience'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'provience': provience,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Query].
  factory Query.fromJson(String data) {
    return Query.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Query] to a JSON string.
  String toJson() => json.encode(toMap());

  Query copyWith({
    String? provience,
  }) {
    return Query(
      provience: provience ?? this.provience,
    );
  }
}
