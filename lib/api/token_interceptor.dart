
import 'package:dio/dio.dart';

import '../env/env.dart';

class TokenInterceptor extends Interceptor {

  @override
  Future onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    options.queryParameters['key'] = Env.apiKey;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data
    super.onResponse(response, handler);
  }

  @override
  Future onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    // If the error is 401 Unauthorized, log out the user
    if (err.response?.statusCode == 401) {
      //_repository.logOut();
      //_appDatabase.userDao.deleteAllUsers();
    }
    super.onError(err, handler);
  }
}