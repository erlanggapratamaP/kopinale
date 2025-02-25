import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:kopinale/core/constants/variables.dart';
import 'package:kopinale/data/datasources/auth_local_datasource.dart';
import 'package:kopinale/data/models/responses/login/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/login'),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode <= 201) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(Uri.parse('${Variables.baseUrl}/logout'),
        headers: {'Authorization': 'Bearer ${authData?.accessToken}'});

    if (response.statusCode == 200) {
      AuthLocalDatasource().removeAuthData();
      return Right(response.body);
    } else {
      return Left(response.body);
    }
  }
}
