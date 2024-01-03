import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shop_go/core/exception/server_exception.dart';

class NetworkManager {
  late final Dio _dio;

  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init();

  init({
    /// base url
    required String baseUrl,

    /// send timeout seconds
    required int sendTimeOut,

    /// connect timeOut seconds
    required int connectTimeOut,

    /// receive time out seconds
    required int receiveTimeOut,
  }) {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      sendTimeout: Duration(seconds: sendTimeOut),
      connectTimeout: Duration(seconds: connectTimeOut),
      receiveTimeout: Duration(seconds: receiveTimeOut),
      validateStatus: (status) {
        return status! < 401;
      },
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    );
    _dio = Dio(baseOptions);
  }

  Future dioPost({required String path, required model, required responseModel}) async {
    try {
      final response = await _dio.post(path, data: model.toJson());
      print(response.data);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return responseModel.fromJson(jsonBody);
        }
      }
    } on DioException catch (e) {
      return ServerException(
          message: e.message.toString(), statusCode: e.response!.statusCode.toString());
    }
  }
}
