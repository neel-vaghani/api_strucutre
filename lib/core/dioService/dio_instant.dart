import 'package:dio/dio.dart';
import 'package:neel_api_demo/core/dioService/dio_interceptor.dart';

abstract class APIDio {
  static final _dio = _getDio();
  static Dio get instance => _dio;
  static Dio _getDio() {
    // api dio object
    final options = BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      validateStatus: (statusCode) {
        if (statusCode == null) {
          return false;
        }
        if (statusCode == 422) {
          // your http status code
          return true;
        } else {
          return statusCode >= 200 && statusCode < 300;
        }
      },
    );
    // interceptors
    final interceptor = getInterceptor("API DIO");
    return Dio(options)..interceptors.add(interceptor);
  }
}
