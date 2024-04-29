import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:kopinale/core/constants/variables.dart';
import 'package:kopinale/data/datasources/auth_local_datasource.dart';
import 'package:kopinale/data/models/responses/address/address_response_model.dart';

class AddressRemoteDatasource {
  Future<Either<String, AddressResponseModel>> getAddresses() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.get(
        Uri.parse('${Variables.baseUrl}/addresses'),
        headers: {
          'Authorization': 'Bearer ${authData?.accessToken}',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return Right(AddressResponseModel.fromJson(response.body));
      } else {
        return const Left('Error');
      }
    } catch (e) {
      return const Left('Error');
    }
  }

  Future<Either<String, String>> addAddress(Map<String, dynamic> data) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.post(
        Uri.parse(
          '${Variables.baseUrl}/addresses',
        ),
        headers: {
          'Authorization': 'Bearer ${authData?.accessToken}',
          'Accept': 'application/json',
        },
        body: data,
      );
      if (response.statusCode == 201) {
        return const Right('Success');
      } else {
        return const Left('Error');
      }
    } catch (e) {
      return const Left('Error');
    }
  }
}
