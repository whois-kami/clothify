import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      color: const Color(0xFF504DB5),
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle().copyWith(
      color: Colors.black.withOpacity(0.9),
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: const TextStyle().copyWith(
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
    bodySmall: const TextStyle().copyWith(
      color: Colors.grey,
      fontSize: 14,
      height: 1.7,
    ),
    bodyMedium: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    labelLarge: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 19,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 12.5,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextTheme dartTextTheme = TextTheme();
}
