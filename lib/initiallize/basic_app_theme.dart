import 'package:flutter/material.dart';

class AppTheme {
  AppTheme(this.context);

  final BuildContext context;
  ThemeData get theme => ThemeData.light().copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
}
