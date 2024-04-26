import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:kopinale/core/constants/variables.dart';
import 'package:kopinale/data/models/responses/product/product_response_model.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getAllProducts() async {
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/products'),
    );
    if (response.statusCode == 200) {
      return Right(
        ProductResponseModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    } else {
      return const Left('Internal Server Error');
    }
  }

  Future<Either<String, ProductResponseModel>> getProductByCategory(
      int categoryId) async {
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/products?category_id=$categoryId'),
    );
    if (response.statusCode == 200) {
      return Right(
        ProductResponseModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    } else {
      return const Left('Internal Server Error');
    }
  }
}
