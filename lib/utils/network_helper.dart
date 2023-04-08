import 'dart:io';

import 'package:amimpact/utils/constants.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class NetworkHelper {
  final Dio _dio = Dio();

  NetworkHelper() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final _options = BaseOptions(
      baseUrl: kBaseApiUrl,
      headers: {"Accept": "application/json"},
    );

    _dio.options = _options;

    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
    // _dio.interceptors.add(ErrorInterceptor());
    // _dio.interceptors.add(RequestInterceptor());
    // _dio.interceptors.add(ResponseInterceptor());
  }

  Dio get dio => _dio;
}
