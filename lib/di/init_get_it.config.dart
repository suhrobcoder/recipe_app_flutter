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
import 'package:recipe_app/data/database/dao/recipe_dao.dart' as _i10;
import 'package:recipe_app/data/database/saved_recipes_database.dart' as _i7;
import 'package:recipe_app/data/pref/app_config_pref.dart' as _i9;
import 'package:recipe_app/data/pref/settings_pref.dart' as _i12;
import 'package:recipe_app/data/repository/recipe_repository.dart' as _i6;
import 'package:recipe_app/data/repository/saved_recipes_repository.dart'
    as _i11;
import 'package:recipe_app/data/repository/setting_repository.dart' as _i13;
import 'package:recipe_app/di/app_module.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

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
    gh.factory<_i6.RecipeRepository>(
        () => _i6.RecipeRepository(gh<_i5.RecipeApi>()));
    gh.singleton<_i7.SavedRecipesDatabase>(_i7.SavedRecipesDatabase());
    await gh.singletonAsync<_i8.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i9.AppConfigPref>(
        () => _i9.AppConfigPref(gh<_i8.SharedPreferences>()));
    gh.factory<_i10.RecipeDao>(
        () => _i10.RecipeDao(gh<_i7.SavedRecipesDatabase>()));
    gh.factory<_i11.SavedRecipesRepository>(
        () => _i11.SavedRecipesRepository(gh<_i10.RecipeDao>()));
    gh.factory<_i12.SettingsPref>(
        () => _i12.SettingsPref(gh<_i8.SharedPreferences>()));
    gh.factory<_i13.SettingsRepository>(() => _i13.SettingsRepository(
          gh<_i9.AppConfigPref>(),
          gh<_i12.SettingsPref>(),
        ));
    return this;
  }
}

class _$AppModule extends _i14.AppModule {}
