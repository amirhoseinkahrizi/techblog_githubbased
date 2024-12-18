import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_services;

class DioServices  {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      
      return response;
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .post(url,
            data: dio_services.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST' ))
        .then((value) {
          log("register email  ${value.headers}");
          log("register email  ${value.statusCode}");
          log("register email  ${value.data}");
          return value;
    });
  }
}
