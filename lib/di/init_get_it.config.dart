// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:recipe_app/data/pref/app_config_pref.dart' as _i4;
import 'package:recipe_app/data/pref/settings_pref.dart' as _i5;
import 'package:recipe_app/di/app_module.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

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
    await gh.singletonAsync<_i3.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i4.AppConfigPref>(
        () => _i4.AppConfigPref(gh<_i3.SharedPreferences>()));
    gh.factory<_i5.SettingsPref>(
        () => _i5.SettingsPref(gh<_i3.SharedPreferences>()));
    return this;
  }
}

class _$AppModule extends _i6.AppModule {}
