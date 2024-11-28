
abstract class RawgApiResult<T> {
  const RawgApiResult();

  factory RawgApiResult.success(T? data) = Success<T>;
  factory RawgApiResult.failure(int? statusCode) = Failure<T>;
  factory RawgApiResult.networkError() = NetworkError<T>;
}

class Success<T> extends RawgApiResult<T> {
  final T? data;

  const Success(this.data);
}

class Failure<T> extends RawgApiResult<T> {
  final int? statusCode;

  const Failure(this.statusCode);
}

class NetworkError<T> extends RawgApiResult<T> {
  const NetworkError();
}
