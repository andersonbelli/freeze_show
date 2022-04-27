import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freeze_show/core/http/http_manager.dart';
import 'package:freeze_show/core/http/models/http_exceptions.dart';
import 'package:freeze_show/core/http/models/url_not_found_exception.dart';
import 'package:freeze_show/core/utils/server_config.dart';

class DioImpl implements HttpManager {
  final Dio _dio = Dio();

  @override
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dio.get("${ServerConfig.BASE_URL}/$endpoint");

      if (response.statusCode == 200) {
        return jsonDecode(jsonEncode(response.data));
      }

      throw GenericException(response.data.toString());
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        throw UrlNotFoundException(error: e.message);
      } else {
        throw GenericException("DioError: ${e.error}");
      }
    }
  }

  @override
  Future<dynamic> post(String endpoint, Object body) async {
    try {
      final response =
          await _dio.post("${ServerConfig.BASE_URL}/$endpoint", data: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }

      throw GenericException(response.data.toString());
    } on DioError catch (e) {
      throw GenericException("DioError: ${e.error}");
    }
  }
}
