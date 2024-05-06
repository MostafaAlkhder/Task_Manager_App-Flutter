import 'package:dio/dio.dart';
import 'package:task_manager_app/shared/network/local/remote/custom_exception.dart';
import 'package:task_manager_app/shared/network/local/remote/dependeny_initializer.dart';
import 'package:task_manager_app/shared/network/local/remote/uitls.dart';

enum RequestType { GET, POST, DELETE, PATCH }

class Request {
  String endPoint;
  bool autherized;
  RequestType method;
  Map<String, dynamic>? headers;
  Map<String, dynamic>? body;

  Request(
    this.endPoint,
    this.method, {
    this.autherized = false,
    this.headers,
    this.body,
  }) {
    if (headers == null) {
      headers = {};
    }
    if (this.autherized) {
      headers!["authorization"] = "Bearer " + 'Token here';
    }
  }

  Future<dynamic> sendRequest() async {
    Response? response;
    try {
      response = await DependenyInitializer.dio!.request(
        this.endPoint,
        data: body,
        options: Options(
          method: Uitls.RequestTypeToString(this.method),
          headers: headers,
        ),
      );
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.unknown) {
        throw GenericException(
            type: ExceptionType.ConnectionError,
            errorMessage: "You Have no Internet Connection");
      }
    }
    print('Response is : ${response}');
    if (response!.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    } else {
      throw statusCodesException[response.statusCode] ??
          GenericException(
            type: ExceptionType.Other,
          );
    }
  }
}
