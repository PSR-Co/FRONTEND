import 'package:dio/dio.dart';

import 'constants.dart';

enum RequestType { GET, POST, PATCH, DELETE }

class APIManager {

  /// Singleton Pattern
  static final APIManager _apiManager = APIManager._();
  APIManager._();
  factory APIManager() {
    return _apiManager;
  }

  /// Variables
  final dio = Dio();
  Options defaultOptions = Options();

  /// Request methods
  dynamic request(
      RequestType requestType,
      String path,
      Options? options,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      ) async {

    if (options != null) { options.headers = defaultOptions.headers; }

    dynamic response;
    switch (requestType) {
      case RequestType.GET :
        response = await dio.get(
            BASE_URL + path,
            options: options ?? defaultOptions,
            queryParameters: queryParameters
        );

      case RequestType.POST :
        response = await dio.post(
            BASE_URL + path,
            options: options ?? defaultOptions,
            queryParameters: queryParameters,
            data: data
        );

      case RequestType.PATCH :
        response = await dio.patch(
            BASE_URL + path,
            options: options ?? defaultOptions,
            queryParameters: queryParameters
        );

      case RequestType.DELETE :
        response = await dio.delete(
            BASE_URL + path,
            options: options ?? defaultOptions,
            queryParameters: queryParameters
        );
    }

    return response.data;
  }


  /// Methods of Token
  void writeToken(String accessToken, String refreshToken) async {
    await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
    await storage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);
    setToken();
  }

  void setToken() async {
    defaultOptions.headers = {
      'Accept' : 'application/json',
      'authorization': await storage.read(key: ACCESS_TOKEN_KEY),
    };
  }

  Future<bool> checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null && accessToken == null) {
      return false;
    } else {
      setToken();
      return true;
    }
  }
 }