import 'package:flutter/material.dart';

final lifeTheme = ThemeData(
  // primarySwatch
  primaryColor: Color.fromARGB(255, 40, 40, 40),
  accentColor: Color.fromARGB(255, 10, 10, 10),
  backgroundColor: Color.fromARGB(250, 40, 40, 40),
  primaryTextTheme: const TextTheme(
    headline6: TextStyle(
        color: Color.fromARGB(255, 51, 255, 51), fontWeight: FontWeight.bold),
  ),
  textTheme: const TextTheme(
      bodyText2: TextStyle(
          color: Color.fromARGB(255, 51, 255, 51),
          fontWeight: FontWeight.normal)),
);
