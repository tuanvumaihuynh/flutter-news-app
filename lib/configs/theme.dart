import 'package:bloc_learning/configs/colors.dart';
import 'package:bloc_learning/configs/fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const TextStyle lightText =
      TextStyle(color: AppColors.black, fontFamily: AppFonts.poppins);

  static const TextStyle darkText =
      TextStyle(color: AppColors.whiteGrey, fontFamily: AppFonts.poppins);

  static ThemeData lightThemeData = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: lightText,
      headlineMedium: lightText,
      headlineSmall: lightText,
      bodyLarge: lightText,
      bodyMedium: lightText,
      labelMedium: lightText,
      bodySmall: lightText,
      labelLarge: lightText,
      labelSmall: lightText,
      titleLarge: lightText,
      titleMedium: lightText,
    ),
  );

  static ThemeData darkThemeData = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    chipTheme: const ChipThemeData(selectedColor: AppColors.teal),
    textTheme: const TextTheme(
      headlineLarge: darkText,
      headlineMedium: darkText,
      headlineSmall: darkText,
      bodyLarge: darkText,
      bodyMedium: darkText,
      labelMedium: darkText,
      bodySmall: darkText,
      labelLarge: darkText,
      labelSmall: darkText,
      titleLarge: darkText,
      titleMedium: darkText,
    ),
  );
}
