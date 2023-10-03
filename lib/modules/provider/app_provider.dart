import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String currentLocal = "ar";
  ThemeMode currentTheme = ThemeMode.light;

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  changeLanguage(String newLanguage) {
    if (currentLocal == newLanguage) return;
    currentLocal = newLanguage;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  String backgroundImage() {
    return isDark() ? "assets/images/bg_dark.png" : "assets/images/img_9.png";
  }
}
