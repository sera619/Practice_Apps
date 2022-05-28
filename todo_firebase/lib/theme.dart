// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // light color theme
  static const Color _light_black = Color.fromRGBO(4, 1, 1, 1);
  static const Color _light_darkred = Color.fromRGBO(101, 10, 11, 1);
  static const Color _light_red = Color.fromRGBO(154, 1, 1, 1);
  static const Color _light_orange = Color.fromARGB(255, 248, 170, 0);
  static const Color _light_darkerOrange = Color.fromARGB(255, 192, 166, 82);

  // dark color theme
  static const Color _dark_black = Color.fromARGB(255, 12, 12, 12);
  static const Color _dark_darkgreen = Color.fromRGBO(0, 31, 38, 1);
  static const Color _dark_green = Color.fromARGB(255, 1, 34, 41);
  //static const Color _dark_lightblue = Color.fromRGBO(0, 95, 114, 1);
  static const Color _dark_cyan = Color.fromARGB(255, 2, 247, 255);
  static const Color headCyan = Color.fromARGB(255, 2, 247, 255);
  static const Color darkerCyan = Color.fromARGB(255, 11, 132, 136);

  static const Gradient verticalOrangeGradient = LinearGradient(
    // ignore: prefer_const_literals_to_create_immutables
    colors: [
      Color.fromARGB(255, 240, 36, 0),
      Color.fromARGB(255, 212, 96, 1),
      Color.fromARGB(255, 228, 156, 0),
      Color.fromARGB(255, 235, 207, 85),
      Color.fromARGB(255, 253, 226, 152),
      Color.fromARGB(255, 235, 207, 85),
      Color.fromARGB(255, 228, 156, 0),
      Color.fromARGB(255, 212, 96, 1),
      Color.fromARGB(255, 240, 36, 0),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient orangeGradient = LinearGradient(colors: [
    Color.fromARGB(255, 240, 36, 0),
    Color.fromARGB(255, 212, 96, 1),
    Color.fromARGB(255, 228, 156, 0),
    Color.fromARGB(255, 235, 207, 85),
    Color.fromARGB(255, 253, 226, 152),
    Color.fromARGB(255, 235, 207, 85),
    Color.fromARGB(255, 228, 156, 0),
    Color.fromARGB(255, 212, 96, 1),
    Color.fromARGB(255, 240, 36, 0),
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static const LinearGradient blueGradient = LinearGradient(colors: [
    Color.fromARGB(255, 1, 41, 32),
    Color.fromARGB(255, 1, 85, 81),
    Color.fromARGB(255, 3, 124, 118),
    Color.fromARGB(255, 7, 177, 168),
    Color.fromARGB(255, 10, 241, 203),
    Color.fromARGB(255, 7, 177, 168),
    Color.fromARGB(255, 3, 124, 118),
    Color.fromARGB(255, 1, 85, 81),
    Color.fromARGB(255, 1, 41, 32),
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static const LinearGradient verticalblueGradient = LinearGradient(colors: [
    Color.fromARGB(255, 1, 41, 32),
    Color.fromARGB(255, 1, 85, 81),
    Color.fromARGB(255, 3, 124, 118),
    Color.fromARGB(255, 7, 177, 168),
    Color.fromARGB(255, 10, 241, 203),
    Color.fromARGB(255, 7, 177, 168),
    Color.fromARGB(255, 3, 124, 118),
    Color.fromARGB(255, 1, 85, 81),
    Color.fromARGB(255, 1, 41, 32),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static const Color _icon_color = Color.fromRGBO(255, 255, 255, 1);

  static const TextStyle _darkHeadingText = TextStyle(
    color: _dark_cyan,
    fontSize: 22,
    fontFamily: 'Nocen',
  );

  static const TextStyle _darkBodyText = TextStyle(
    color: darkerCyan,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontFamily: 'Rubik',
  );

  static const TextStyle _lightHeadingText = TextStyle(
    color: _light_orange,
    fontSize: 22,
    fontFamily: 'Nocen',
  );

  static const TextStyle _lightBodyText = TextStyle(
    color: _light_darkerOrange,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontFamily: 'Rubik',
  );
  static const TextStyle _lightButtonText = TextStyle(
    color: _light_black,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Nocen',
  );

  static const TextStyle _darkButtonText = TextStyle(
    color: _light_black,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: 'Nocen',
  );

  static final TextTheme _lightTextTheme = TextTheme(
      headline1: _lightHeadingText, bodyText1: _lightBodyText, headline2: _lightButtonText);

  static final TextTheme _darkTextTheme =
      TextTheme(headline1: _darkHeadingText, bodyText1: _darkBodyText, headline2: _darkButtonText);

  // light theme
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _dark_black,
    appBarTheme: const AppBarTheme(
      color: _light_red,
    ),
    iconTheme: IconThemeData(color: _icon_color),
    cardTheme: CardTheme(shadowColor: _light_red),
    bottomAppBarColor: _light_red,
    colorScheme: const ColorScheme.light(
      primary: _light_red,
      onPrimary: _light_orange,
      secondary: _light_darkred,
    ),
    textTheme: _lightTextTheme,
  );
  // Dark theme
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _dark_darkgreen,
      appBarTheme: const AppBarTheme(
        color: _dark_darkgreen,
      ),
      iconTheme: IconThemeData(color: _icon_color),
      bottomAppBarColor: _dark_darkgreen,
      colorScheme: const ColorScheme.dark(
        primary: _dark_darkgreen,
        onPrimary: _dark_cyan,
        secondary: _dark_green,
      ),
      textTheme: _darkTextTheme);
}
