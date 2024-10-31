import 'dart:developer';

import 'package:dio/dio.dart';

class DioServices {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: "GET"))
        .then((response) {
      return response;
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .post(url,
            data: map,
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((value) {

         log(value.headers.toString());
         log(value.data.toString());
         log(value.statusCode.toString());

      return value;
    });
  }
}
