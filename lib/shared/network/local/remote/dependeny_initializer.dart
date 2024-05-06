import 'package:dio/dio.dart';

class DependenyInitializer {
  static Dio? dio;
  static String? token;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com/',
        receiveDataWhenStatusError: true,
      ),
    );
    token = 'Token Here';
  }
}
