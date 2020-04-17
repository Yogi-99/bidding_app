import 'package:flutter/material.dart';

enum AppTheme { Light, Dark }

final appTheme = {
  AppTheme.Light: ThemeData.light().copyWith(
    primaryColor: Color(0xFF0f4c75),
  ),
  AppTheme.Dark: ThemeData.dark().copyWith(
    applyElevationOverlayColor: true,
  ),
};
