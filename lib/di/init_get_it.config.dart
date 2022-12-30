// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:recipe_app/data/api/auth_interceptor.dart' as _i3;
import 'package:recipe_app/data/api/recipe_api.dart' as _i5;
import 'package:recipe_app/data/pref/app_config_pref.dart' as _i7;
import 'package:recipe_app/data/pref/settings_pref.dart' as _i8;
import 'package:recipe_app/di/app_module.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

const String _dev = 'dev';
const String _prod = 'prod';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.AuthInterceptor>(
      _i3.AuthInterceptor(),
      instanceName: 'AuthInterceptor',
    );
    gh.singleton<_i4.Dio>(
      appModule
          .dioDev(gh<_i3.AuthInterceptor>(instanceName: 'AuthInterceptor')),
      registerFor: {_dev},
    );
    gh.singleton<_i4.Dio>(
      appModule
          .dioProd(gh<_i3.AuthInterceptor>(instanceName: 'AuthInterceptor')),
      registerFor: {_prod},
    );
    gh.singleton<_i5.RecipeApi>(_i5.RecipeApi(gh<_i4.Dio>()));
    await gh.singletonAsync<_i6.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i7.AppConfigPref>(
        () => _i7.AppConfigPref(gh<_i6.SharedPreferences>()));
    gh.factory<_i8.SettingsPref>(
        () => _i8.SettingsPref(gh<_i6.SharedPreferences>()));
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
