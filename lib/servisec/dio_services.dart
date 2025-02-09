import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_services;
import 'package:get_storage/get_storage.dart';
import 'package:techblog_githubbased/constante/storage_const.dart';

class DioServices {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      return response;
    }).catchError((err) {
      if (err is DioException) {
        return err.response!;
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    var token = GetStorage().read(StoraegKey().token);
    if (token != null) {
      dio.options.headers['authorization'] = token;
    }
    return await dio
        .post(url,
            data: dio_services.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((response) {
      log("register email  ${response.headers}");
      log("register email  ${response.statusCode}");
      log("register email  ${response.data}");
      return response;
    }).catchError((err) {
      if (err is DioException) {
        return err.response!;
      }
    });
  }
}
