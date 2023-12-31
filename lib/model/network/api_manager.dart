import 'package:dio/dio.dart';
import 'package:psr/model/network/cutsom_interceptor.dart';

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

    if (options != null && options.headers != null) {
      defaultOptions.headers!.addAll(options.headers!);
    }

    dio.interceptors.add(CustomInterceptor());

    dynamic response;
    switch (requestType) {
      case RequestType.GET :
        response = await dio.get(
            BASE_URL + path,
            options: defaultOptions,
            queryParameters: queryParameters
        );

      case RequestType.POST :
        response = await dio.post(
            BASE_URL + path,
            options: defaultOptions,
            queryParameters: queryParameters,
            data: data
        );

      case RequestType.PATCH :
        response = await dio.patch(
            BASE_URL + path,
            options: defaultOptions,
            queryParameters: queryParameters,
            data: data
        );

      case RequestType.DELETE :
        response = await dio.delete(
            BASE_URL + path,
            options: defaultOptions,
            queryParameters: queryParameters
        );
    }

    // print('api + ${response}');
    // print('api + ${response.data}');

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

  void writeUserType(String type) async {
    await storage.write(key: USER_TYPE, value: type);
    // final saved_type = await storage.read(key: USER_TYPE);
    // print('유저 타입 -> ${saved_type}');
  }

  Future<bool> checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    // final accessToken = await '포맨으로 받아온 액세스 토큰값 입력 (토큰값은 커밋에서 제외시켜주세여)';

    if (refreshToken == null && accessToken == null) {
      return false;
    } else {
      setToken();
      return true;
    }
  }
 }