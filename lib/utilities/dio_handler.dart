import 'dart:developer';

import 'package:dio/dio.dart';

var baseUrl = "https://rereadmedical.azurewebsites.net/gmo/iin/";

class DioHandler {
  static final Dio dio = Dio();

  static Future<dynamic> dioPOST({
    String? path,
    dynamic body,
  }) async {
    Map<String, dynamic> headers = {
      "content-type": "application/json",
    };
    DioHandler.dio.options.headers.addAll(headers);
    var postURL = baseUrl;
    log(postURL);

    // Print the request data
    log('Request Body: $body');

    try {
      Response response;

      response = await DioHandler.dio
          .post(
            postURL,
            data: body,
          )
          .timeout(const Duration(seconds: 60));

      return response.data;
    } on DioException catch (e) {
      log("DioError: $e");
      return e.response?.data ?? {'error': e.message};
    }
  }

  static Future<dynamic> dioGET({
    String? path,
  }) async {
    Map<String, dynamic> headers = {
      "content-type": "application/json",
      "Connection": "keep-alive",
    };
    DioHandler.dio.options.headers.addAll(headers);
    var postURL = baseUrl;
    try {
      Response response;

      response = await DioHandler.dio
          .get(postURL)
          .timeout(const Duration(seconds: 60));

      return response.data;
    } on DioException catch (e) {
      log("DioError: $e");
      return e.response?.data ?? {'error': e.message};
    }
  }
}
