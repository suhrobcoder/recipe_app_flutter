part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool isNightTheme;

  const SettingsState({
    required this.isNightTheme,
  });

  SettingsState copyWith({
    bool? isNightTheme,
  }) {
    return SettingsState(
      isNightTheme: isNightTheme ?? this.isNightTheme,
    );
  }

  @override
  List<Object> get props => [isNightTheme];
}
