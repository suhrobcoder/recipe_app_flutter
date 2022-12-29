import 'package:flutter/material.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/pages/home/page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
