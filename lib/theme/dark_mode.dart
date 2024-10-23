import 'package:flutter/material.dart';

ThemeData darkMode=ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Color.fromARGB(255, 24, 24, 24),
        primary: Color.fromARGB(255, 34, 34, 34),
        secondary: Color.fromARGB(255, 49, 49, 49),
        inversePrimary: Colors.grey.shade300
    )
);