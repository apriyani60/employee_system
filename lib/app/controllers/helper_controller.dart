import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';

class HelperController extends getx.GetxController {
  final Dio _client = Dio(
    BaseOptions(
      baseUrl: "https://reqres.in/",
      // receiveTimeout: 10000, // 10 seconds
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      contentType: Headers.formUrlEncodedContentType,
    ),
  );

  Future<Object?> get<T>(
      {@required String? path,
      @required T Function(dynamic data)? onSuccess,
      @required T Function(dynamic error)? onError,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      bool isRawResult = true,
      bool isResultCode = false}) async {
    bool result = true;
    if (result == true) {
      try {
        final response = await _client.get(
          path!,
          options: Options(headers: headers),
          queryParameters: queryParameters,
        );

        return isRawResult
            ? onSuccess!(response.data)
            : onSuccess!(response.data['data']);
      } on DioError catch (e) {
        print('${e.message} for $path');
      } catch (e) {
        print(e.toString());
        return onError!(e);
      }
    } else {
      print('No Connnection');
    }
  }

  /// Performs a POST request with [body], then executes the functions
  /// with generic return value
  Future<Object?> post<T>({
    @required String? path,
    @required T Function(dynamic content)? onSuccess,
    @required T Function(dynamic error)? onError,
    @required Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool containsFile = false,
    bool isRawResult = false,
    bool isResultCode = false,
  }) async {
    bool result = true;
    if (result == true) {
      try {
        _client.interceptors.add(LogInterceptor());
        final response = await _client.post(
          path!,
          data: containsFile ? FormData.fromMap(body!) : body,
          options: Options(
            headers: headers,
            contentType: Headers.jsonContentType,
          ),
        );

        return isRawResult
            ? onSuccess!(response.data)
            : onSuccess!(response.data);
      } on DioError catch (e) {
        print('${e.message} for $path');
        return onError!(e);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print('No internet :( Reason:');
    }
  }
}
