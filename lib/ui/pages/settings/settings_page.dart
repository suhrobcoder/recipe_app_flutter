import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/pages/settings/bloc/settings_bloc.dart';
import 'package:recipe_app/ui/theme/constants.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsBloc>(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return SettingsList(
            contentPadding: const EdgeInsets.only(top: defaultPadding),
            sections: [
              SettingsSection(
                title: const Text("Theme"),
                tiles: [
                  SettingsTile.switchTile(
                    title: const Text("Night theme"),
                    onToggle: (value) =>
                        context.read<SettingsBloc>().add(ChangeTheme()),
                    initialValue: state.isNightTheme,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class SettingsAppBar extends AppBar {
  SettingsAppBar({Key? key})
      : super(
          key: key,
          title: const Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        );
}
