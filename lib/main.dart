import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/getxTheme.dart';
import 'package:notesapp/splashscreen.dart';
import 'package:notesapp/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    prefs,
  ));
}

class MyApp extends StatelessWidget {
  final getThemeController = Get.put(GetXTheme());
  final prefs;
  MyApp(
    this.prefs,
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _getTheme(prefs),
      home: SplashScreen(),
    );
  }

  ThemeData _getTheme(SharedPreferences prefs) {
    getThemeController.isLightMode.value = prefs.getBool("Theme") ?? true;
    return getThemeController.isLightMode.value
        ? Themes.lightTheme
        : Themes.darkTheme;
  }
}
