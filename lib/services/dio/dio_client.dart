import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final interceptors = DioInterceptors();
  dio.interceptors.add(interceptors);
  return dio;
});

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = {"Content-Type": "application/json"};

    options.baseUrl = 'https://www.ncl.com';
    options.headers.addAll(headers);

    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.response:
        _handleError(err);
        break;

      default:
        err = DioError(
          type: DioErrorType.other,
          requestOptions: err.requestOptions,
          error: 'Something went wrong',
        );
    }

    handler.next(err);
  }

  void _handleError(DioError error) {
    error = DioError(
      type: error.type,
      requestOptions: error.requestOptions,
      error: error.response?.statusMessage,
    );
  }
}
