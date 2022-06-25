import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

enum AppTheme { main }

final appThemeData = {
  AppTheme.main: ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.white,
    primaryColorDark: AppColors.grey,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryColor,
      ),
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.grey,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
  ),
};

/// Alert animation types
enum AnimationTypes { fromRight, fromLeft, fromTop, fromBottom, grow, shrink }
