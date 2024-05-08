import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:kopinale/core/constants/variables.dart';
import 'package:kopinale/data/models/responses/city/city_response_model.dart';
import 'package:kopinale/data/models/responses/provience/provience_response_model.dart';

class RajaongkirRemotedatasource {
  Future<Either<String, ProvienceResponseModel>> getProvinces() async {
    final url = Uri.parse('https://api.rajaongkir.com/starter/province');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return Right(ProvienceResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  Future<Either<String, CityResponseModel>> getCitiesByProvience(
      String provienceId) async {
    final url = Uri.parse(
        'https://api.rajaongkir.com/starter/city?provience=$provienceId');
    final response = await http.get(
      url,
      headers: {'key': Variables.baseUrl},
    );
    if (response.statusCode == 200) {
      return Right(CityResponseModel.fromJson(response.body));
    } else {
      return const Left('Error');
    }
  }

  // Future<Either<String, CityResponseModel>> getDistrictByCity(
  //     String cityId) async {
  //   final url = Uri.parse(
  //       'https://api.rajaongkir.com/starter/subdistrict?city=$cityId');
  //   final response = await http.get(
  //     url,
  //     headers: {'key': Variables.rajaOngkirKey},
  //   );

  //   if (response.statusCode == 200) {
  //     return Right(CityResponseModel.fromJson(response.body));
  //   } else {
  //     return const Left('Error');
  //   }
  // }
}
