import 'package:delivery_hero_challenge/app/app_defaults.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 231, 233, 238),
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
      color: Color.fromARGB(232, 26, 25, 73),
      fontSize: 14,
    ),
    subtitle2: TextStyle(
      color: Color.fromARGB(135, 61, 12, 139),
      fontSize: 12,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.all(AppDefaults.kStandartContentPadding),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDefaults.kStandartBorderRadius),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 67, 96, 192),
        width: 0.3,
        style: BorderStyle.none,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDefaults.kStandartBorderRadius),
      borderSide: const BorderSide(
        color: Color.fromARGB(136, 92, 42, 172),
        width: 1,
        style: BorderStyle.none,
      ),
    ),
    labelStyle: const TextStyle(
      color: Color.fromARGB(232, 26, 25, 73),
      fontSize: 16,
    ),
    hintStyle: const TextStyle(
      color: Color.fromARGB(232, 26, 25, 73),
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    errorStyle: const TextStyle(
      fontSize: 0,
      letterSpacing: 0,
      wordSpacing: 0,
      height: 0,
    ),
    counterStyle: const TextStyle(
      fontSize: 0,
      letterSpacing: 0,
      wordSpacing: 0,
      height: 0,
    ),
    errorMaxLines: 0,
    isDense: false,
    isCollapsed: false,
    prefixStyle: const TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: const TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: false,
    fillColor: const Color(0x00000000),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    disabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  ),
);
