import 'package:dio/dio.dart';
import 'package:video_games_manager_flutter/api/rawg_api_result.dart';

class ResultCall<T> {
  final Dio dio;

  ResultCall(this.dio);

  Future<RawgApiResult<T>> callApi(Future<Response<T>> Function() apiCall) async {
    try {
      final response = await apiCall();
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return RawgApiResult.success(response.data);
      } else {
        return RawgApiResult.failure(response.statusCode);
      }
    } catch (e) {
      if (e is DioException) {
        return RawgApiResult.networkError();
      } else {
        return RawgApiResult.failure(null);
      }
    }
  }
}
