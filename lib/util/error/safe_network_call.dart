import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/util/error/failures.dart';

Future<Either<T, Failure>> safeNetworkCall<T>(
    Future<T> Function() block) async {
  try {
    return left(await block());
  } on DioError catch (error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return right(TimeoutFailure());
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case 404:
            return right(AuthFailure());
          default:
            return right(UnknownFailure());
        }
      case DioErrorType.cancel:
        return right(UnknownFailure());
      default:
        return right(UnknownFailure());
    }
  } on Exception {
    return right(UnknownFailure());
  }
}
