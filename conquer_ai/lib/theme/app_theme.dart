import 'package:conquer_ai/theme/pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    //create Pallete class
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Pallete.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Pallete.backgroundColor,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Pallete.blueColor,
      ),
    );
  }
}
