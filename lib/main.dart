import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/repository/setting_repository.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/pages/home/page.dart';
import 'package:recipe_app/ui/pages/onboarding/page.dart';
import 'package:recipe_app/ui/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(environment: Environment.dev);
  final isFirstRun = getIt<SettingsRepository>().isFirstRun;
  runApp(MyApp(showOnboarding: isFirstRun));
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;

  const MyApp({Key? key, required this.showOnboarding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: showOnboarding ? const OnboardingPage() : const HomePage(),
    );
  }
}
