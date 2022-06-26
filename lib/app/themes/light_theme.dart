import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 199, 203, 215),
  indicatorColor: const Color.fromARGB(255, 67, 96, 192),
  primaryColor: const Color.fromARGB(255, 67, 96, 192),
  selectedRowColor: const Color.fromARGB(136, 92, 42, 172),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color.fromARGB(255, 67, 96, 192),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 67, 96, 192),
  ),
  fontFamily: GoogleFonts.ubuntu().fontFamily,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Color.fromARGB(232, 229, 229, 229),
    ),
    bodyText2: TextStyle(
      color: Color.fromARGB(232, 229, 229, 229),
      fontSize: 24,
    ),
    subtitle1: TextStyle(
      color: Color.fromARGB(232, 229, 229, 229),
      fontSize: 20,
    ),
  ),
);
