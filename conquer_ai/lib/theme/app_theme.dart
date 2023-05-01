import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    //create Pallete class
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
