import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefManager {
  static late SharedPreferences prefs;
  static String themeVarName = 'current-theme';
  static String langVarName = 'current-lang';
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void setTheme(ThemeMode newTheme) {
    prefs.setString(
      themeVarName,
      newTheme == ThemeMode.light ? 'light' : 'dark',
    );
  }

  static void setLang(Locale newLocale) {
    prefs.setString(langVarName, newLocale == Locale('en') ? 'en' : 'ar');
  }

  static Locale getLang() {
    String? lang = prefs.getString(langVarName);

    if (lang == null || lang == 'en') {
      return Locale('en');
    } else {
      return Locale('ar');
    }
  }

  static ThemeMode getTheme() {
    String? theme = prefs.getString(themeVarName);

    if (theme == null || theme == 'light') {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }
}
