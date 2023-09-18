import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jsonflutter/models/api_response.dart';
import 'package:jsonflutter/models/product.dart';

import 'Request.dart';

class ProductDealerApi extends Requester {
  Future<ApiResponse> SendProductSync(Product p) async {
    try {
      Dio client = Client();

      String query = "/productdealerapi/v1/product";
      final response = await client.post(query, data: p);
      try {
        final rawData = json.decode(response.toString());
        if (rawData['error'] != null) {
          throw Exception('${rawData['code']}: ${rawData['message']}');
        }
        return ApiResponse.fromMap(rawData);
      } catch (ex) {
        throw Exception(ex);
      }
    } on DioError catch (ex) {
      String errorMessage = ex.response.toString();
      throw errorMessage;
    }
  }
}
