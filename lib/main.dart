import 'package:daily_notes/locator.dart';
import 'package:daily_notes/preferences/preferences.dart';
import 'package:daily_notes/routes/router.dart';
import 'package:daily_notes/themes/themes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Daily  Notes',
      theme: DNThemes.purpleDark,
    );
  }
}
