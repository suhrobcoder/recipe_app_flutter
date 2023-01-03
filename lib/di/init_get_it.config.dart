// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:recipe_app/data/api/auth_interceptor.dart' as _i3;
import 'package:recipe_app/data/api/recipe_api.dart' as _i6;
import 'package:recipe_app/data/database/dao/recipe_dao.dart' as _i11;
import 'package:recipe_app/data/database/saved_recipes_database.dart' as _i8;
import 'package:recipe_app/data/pref/app_config_pref.dart' as _i10;
import 'package:recipe_app/data/pref/settings_pref.dart' as _i13;
import 'package:recipe_app/data/repository/recipe_repository.dart' as _i7;
import 'package:recipe_app/data/repository/saved_recipes_repository.dart'
    as _i12;
import 'package:recipe_app/data/repository/setting_repository.dart' as _i14;
import 'package:recipe_app/di/app_module.dart' as _i16;
import 'package:recipe_app/ui/pages/home/bloc/home_bloc.dart' as _i5;
import 'package:recipe_app/ui/pages/onboarding/bloc/onboarding_bloc.dart'
    as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

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
    gh.factory<_i5.HomeBloc>(() => _i5.HomeBloc());
    gh.singleton<_i6.RecipeApi>(_i6.RecipeApi(gh<_i4.Dio>()));
    gh.factory<_i7.RecipeRepository>(
        () => _i7.RecipeRepository(gh<_i6.RecipeApi>()));
    gh.singleton<_i8.SavedRecipesDatabase>(_i8.SavedRecipesDatabase());
    await gh.singletonAsync<_i9.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i10.AppConfigPref>(
        () => _i10.AppConfigPref(gh<_i9.SharedPreferences>()));
    gh.factory<_i11.RecipeDao>(
        () => _i11.RecipeDao(gh<_i8.SavedRecipesDatabase>()));
    gh.factory<_i12.SavedRecipesRepository>(
        () => _i12.SavedRecipesRepository(gh<_i11.RecipeDao>()));
    gh.factory<_i13.SettingsPref>(
        () => _i13.SettingsPref(gh<_i9.SharedPreferences>()));
    gh.factory<_i14.SettingsRepository>(() => _i14.SettingsRepository(
          gh<_i10.AppConfigPref>(),
          gh<_i13.SettingsPref>(),
        ));
    gh.factory<_i15.OnboardingBloc>(
        () => _i15.OnboardingBloc(gh<_i14.SettingsRepository>()));
    return this;
  }
}

class _$AppModule extends _i16.AppModule {}
