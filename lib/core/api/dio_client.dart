import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/api/api_endpoints.dart';

@Injectable()
class DioClient {
  final Dio dio;
  DioClient()
      : dio = Dio(BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        )) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer token';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    ));
  }
}
