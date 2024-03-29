// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:recipe_app/data/api/auth_interceptor.dart' as _i3;
import 'package:recipe_app/data/api/recipe_api.dart' as _i6;
import 'package:recipe_app/data/database/dao/recipe_dao.dart' as _i12;
import 'package:recipe_app/data/database/saved_recipes_database.dart' as _i8;
import 'package:recipe_app/data/model/recipe.dart' as _i17;
import 'package:recipe_app/data/pref/app_config_pref.dart' as _i11;
import 'package:recipe_app/data/pref/settings_pref.dart' as _i14;
import 'package:recipe_app/data/repository/recipe_repository.dart' as _i7;
import 'package:recipe_app/data/repository/saved_recipes_repository.dart'
    as _i13;
import 'package:recipe_app/data/repository/setting_repository.dart' as _i15;
import 'package:recipe_app/di/app_module.dart' as _i22;
import 'package:recipe_app/ui/pages/details/bloc/details_bloc.dart' as _i16;
import 'package:recipe_app/ui/pages/home/bloc/home_bloc.dart' as _i5;
import 'package:recipe_app/ui/pages/onboarding/bloc/onboarding_bloc.dart'
    as _i18;
import 'package:recipe_app/ui/pages/recipes/bloc/recipes_bloc.dart' as _i19;
import 'package:recipe_app/ui/pages/saved/bloc/saved_bloc.dart' as _i20;
import 'package:recipe_app/ui/pages/search/bloc/search_bloc.dart' as _i9;
import 'package:recipe_app/ui/pages/settings/bloc/settings_bloc.dart' as _i21;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
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
    gh.factory<_i9.SearchBloc>(
        () => _i9.SearchBloc(gh<_i7.RecipeRepository>()));
    await gh.singletonAsync<_i10.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i11.AppConfigPref>(
        _i11.AppConfigPref(gh<_i10.SharedPreferences>()));
    gh.singleton<_i12.RecipeDao>(
        _i12.RecipeDao(gh<_i8.SavedRecipesDatabase>()));
    gh.lazySingleton<_i13.SavedRecipesRepository>(
        () => _i13.SavedRecipesRepository(gh<_i12.RecipeDao>()));
    gh.singleton<_i14.SettingsPref>(
        _i14.SettingsPref(gh<_i10.SharedPreferences>()));
    gh.factory<_i15.SettingsRepository>(() => _i15.SettingsRepository(
          gh<_i11.AppConfigPref>(),
          gh<_i14.SettingsPref>(),
        ));
    gh.factoryParam<_i16.DetailsBloc, _i17.Recipe, dynamic>((
      recipe,
      _,
    ) =>
        _i16.DetailsBloc(
          gh<_i7.RecipeRepository>(),
          gh<_i13.SavedRecipesRepository>(),
          recipe,
        ));
    gh.factory<_i18.OnboardingBloc>(
        () => _i18.OnboardingBloc(gh<_i15.SettingsRepository>()));
    gh.factory<_i19.RecipesBloc>(() => _i19.RecipesBloc(
          gh<_i7.RecipeRepository>(),
          gh<_i15.SettingsRepository>(),
        ));
    gh.factory<_i20.SavedBloc>(
        () => _i20.SavedBloc(gh<_i13.SavedRecipesRepository>()));
    gh.factory<_i21.SettingsBloc>(
        () => _i21.SettingsBloc(gh<_i15.SettingsRepository>()));
    return this;
  }
}

class _$AppModule extends _i22.AppModule {}
