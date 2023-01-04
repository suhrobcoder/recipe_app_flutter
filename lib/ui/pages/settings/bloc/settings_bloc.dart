import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/repository/setting_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc(
    this.settingsRepository,
  ) : super(SettingsState(
          isNightTheme: settingsRepository.isDarkTheme,
        )) {
    on<ChangeTheme>((event, emit) {
      emit(state.copyWith(isNightTheme: !state.isNightTheme));
    });
  }
}
