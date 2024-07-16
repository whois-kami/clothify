import 'package:ecom_app/core/styles/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: TTextTheme.dartTextTheme,
  );
}
