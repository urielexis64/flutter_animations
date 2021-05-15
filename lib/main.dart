import 'package:custom_painter/src/pages/launcher_page.dart';
import 'package:custom_painter/src/pages/launcher_tablet%20page.dart';
import 'package:custom_painter/src/shared_prefs/user_preferences.dart';
import 'package:custom_painter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  print(prefs.currentTheme);
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeChanger(prefs.currentTheme), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeChanger>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          }
          return LauncherPage();
        },
      ),
    );
  }
}
