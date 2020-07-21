import 'package:dio/dio.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio(_options);
  }

  BaseOptions _options = BaseOptions(
    baseUrl: 'https://codefirst.herokuapp.com/api/v1',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  Dio get instance => _dio;
}
