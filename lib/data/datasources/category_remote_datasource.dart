import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:kopinale/core/constants/variables.dart';
import 'package:kopinale/data/models/responses/category/category_response_model.dart';

class CategoryRemoteDatasource {
  Future<Either<String, CategoryReponseModel>> getCategories() async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/categories'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Right(CategoryReponseModel.fromJson(data));
    } else {
      return const Left('Internal server error');
    }
  }
}
