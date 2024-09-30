import 'package:flutter/material.dart';

var lightTheme = ThemeData.light().copyWith(
    inputDecorationTheme: InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(
      color: Colors.deepPurple.shade200,
      width: 3,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(
      color: Colors.deepPurple.shade200,
      width: 3,
    ),
  ),
));

var darkTheme = ThemeData.dark().copyWith(
    inputDecorationTheme: InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(
      color: Colors.deepPurple.shade200,
      width: 3,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(
      color: Colors.deepPurple.shade200,
      width: 3,
    ),
  ),
));

getTheme(bool isDark) {
  return isDark ? darkTheme : lightTheme;
}
