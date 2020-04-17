import 'package:bidding_app/global/theme.dart';
import 'package:flutter/material.dart';

class ThemeChangerProvider extends ChangeNotifier {
  ThemeData _selectedTheme;

  ThemeChangerProvider({bool isDarkMode}) {
    _selectedTheme =
        isDarkMode ? appTheme[AppTheme.Dark] : appTheme[AppTheme.Light];
  }

  ThemeData get getTheme => _selectedTheme;
  bool get isDark => _selectedTheme == appTheme[AppTheme.Dark] ? true : false;

  void swapTheme() {
    _selectedTheme = _selectedTheme == appTheme[AppTheme.Dark]
        ? appTheme[AppTheme.Light]
        : appTheme[AppTheme.Dark];

    notifyListeners();
  }
}
