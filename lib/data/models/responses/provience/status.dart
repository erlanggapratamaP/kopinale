import 'dart:convert';

class Status {
  int? code;
  String? description;

  Status({this.code, this.description});

  @override
  String toString() => 'Status(code: $code, description: $description)';

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        code: data['code'] as int?,
        description: data['description'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'code': code,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Status].
  factory Status.fromJson(String data) {
    return Status.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Status] to a JSON string.
  String toJson() => json.encode(toMap());

  Status copyWith({
    int? code,
    String? description,
  }) {
    return Status(
      code: code ?? this.code,
      description: description ?? this.description,
    );
  }
}
