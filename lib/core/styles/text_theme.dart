import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: const TextStyle().copyWith(
      color: const Color(0xFF181D31),
      fontSize: 23,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: const TextStyle().copyWith(
      color: const Color(0xFFBAC0CF),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextTheme dartTextTheme = TextTheme();
}
