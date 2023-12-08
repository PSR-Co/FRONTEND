import 'package:dio/dio.dart';
import 'package:psr/model/network/api_manager.dart';
import '../../auth/view/login_screen.dart';
import 'constants.dart';
import 'package:flutter/material.dart';

class CustomInterceptor extends Interceptor {

  /// Singleton Pattern
  static final CustomInterceptor _customInterceptor = CustomInterceptor._();
  CustomInterceptor._();
  factory CustomInterceptor() {
    return _customInterceptor;
  }

  /// Variables
  final reissuePath = '/users/reissue';

  int? statusCode;
  String? errorMsg;

  /// Override Methods
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {

    statusCode = err.response?.data['code'];
    errorMsg = err.response?.data['message'];

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null) { return handler.reject(err); }

    print('statusCode -> $statusCode');
    print('errorMsg -> $errorMsg');

    /// 403 토큰 오류이며, 토큰 재발급 중 발생한 오류가 아닌 경우
    if (statusCode == 403 && !(err.requestOptions.path == reissuePath)) {

      final dio = Dio();
      try {
        // 토큰 재발급 요청 전송
        print('try :: 토큰 재발급 요청 전송');
        final response = await dio.post(
          BASE_URL + reissuePath,
          data: {
            'accessToken': accessToken,
            'refreshToken': refreshToken
          }
        );

        // 재발급 요청 응답값을 통해 토큰 갱신
        final newAccessToken = response.data['data']['accessToken'];
        final newRefreshToken = response.data['data']['refreshToken'];

        APIManager().writeToken(newAccessToken, newRefreshToken);

        final options = err.requestOptions;
        options.headers.addAll({
          'authorization': newAccessToken,
        });

        final resp = await dio.fetch(options);

        return handler.resolve(resp);

      } on DioError catch (e) {
        statusCode = -1;
        // print('status code -> $statusCode');
        return handler.reject(e);
      }

    }

    return super.onError(err, handler);
  }

  void resetViewWithLoginScreen(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }
}