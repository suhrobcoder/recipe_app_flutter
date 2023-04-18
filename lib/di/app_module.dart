import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/api/auth_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @dev
  @singleton
  Dio dioDev(
    @Named("AuthInterceptor") AuthInterceptor authInterceptor,
  ) =>
      Dio(
        BaseOptions(
          validateStatus: ((status) => true),
        ),
      )..interceptors.addAll([
          LogInterceptor(),
          authInterceptor,
        ]);

  @prod
  @singleton
  Dio dioProd(
    @Named("AuthInterceptor") AuthInterceptor authInterceptor,
  ) =>
      Dio(
        BaseOptions(
          validateStatus: ((status) => true),
        ),
      )..interceptors.add(authInterceptor);
}
