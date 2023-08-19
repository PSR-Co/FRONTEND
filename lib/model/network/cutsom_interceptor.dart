import 'package:dio/dio.dart';
import 'constants.dart';

class CustomInterceptor extends Interceptor {

  /// Singleton Pattern
  static final CustomInterceptor _customInterceptor = CustomInterceptor._();
  CustomInterceptor._();
  factory CustomInterceptor() {
    return _customInterceptor;
  }

  /// Variables
  final reissuePath = '/users/reissue';

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

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null) { return handler.reject(err); }

    /// 403 토큰 오류이며, 토큰 재발급 중 발생한 오류가 아닌 경우
    if (err.response?.data['code'] == 403 &&
        !(err.requestOptions.path == reissuePath)) {

      final dio = Dio();
      try {
        // 토큰 재발급 요청 전송
        final response = await dio.post(
          BASE_URL + reissuePath,
          options: Options(
            headers: {
              'authorization': accessToken,
            }
          ),
          data: {
            'accessToken': accessToken,
            'refreshToken': refreshToken
          }
        );

        // 재발급 요청 응답값을 통해 토큰 갱신
        final newAccessToken = response.data['data']['accessToken'];
        final newRefreshToken = response.data['data']['refreshToken'];

        await storage.write(key: ACCESS_TOKEN_KEY, value: newAccessToken);
        await storage.write(key: REFRESH_TOKEN_KEY, value: newRefreshToken);

        final options = err.requestOptions;
        options.headers.addAll({
          'authorization': newAccessToken,
        });

        final resp = await dio.fetch(options);

        return handler.resolve(resp);

      } on DioError catch (e) {
        return handler.reject(e);
      }

    }

    return super.onError(err, handler);
  }
}