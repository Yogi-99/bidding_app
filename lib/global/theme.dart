import 'package:flutter/material.dart';

enum AppTheme { Light, Dark }

final appTheme = {
  AppTheme.Light: ThemeData.light().copyWith(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white)),
  AppTheme.Dark: ThemeData.dark().copyWith(
    backgroundColor: Color(0xFF1b262c),
    primaryColor: Color(0xff0f4c75),
    primaryColorDark: Color(0xFF3282b8),
    applyElevationOverlayColor: true,
  ),
};
