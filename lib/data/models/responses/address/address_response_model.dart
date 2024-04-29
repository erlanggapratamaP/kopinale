import 'dart:convert';

import 'address.dart';

class AddressResponseModel {
  String? status;
  List<Address>? data;

  AddressResponseModel({this.status, this.data});

  @override
  String toString() => 'AddressResponseModel(status: $status, data: $data)';

  factory AddressResponseModel.fromMap(Map<String, dynamic> data) {
    return AddressResponseModel(
      status: data['status'] as String?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Address.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddressResponseModel].
  factory AddressResponseModel.fromJson(String data) {
    return AddressResponseModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddressResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AddressResponseModel copyWith({
    String? status,
    List<Address>? data,
  }) {
    return AddressResponseModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
