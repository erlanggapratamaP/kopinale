// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;
// import 'package:kopinale/core/constants/variables.dart';

// class RajaongkirRemotedatasource {
//   Future<Either<String, ProvienceResponseModel>> getProvinces() async {
//     final url = Uri.parse('');
//     final response = await http.get(
//       url,
//       headers: {
//         'key': Variables.rajaOngkirKey,
//       },
//     );
//     if (response.statusCode == 200) {
//       return Right(ProvienceResponseModel.fromJson(response.body));
//     } else {
//       return Left('Error');
//     }
//   }
// }
