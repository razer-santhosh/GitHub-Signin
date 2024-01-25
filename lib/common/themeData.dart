// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      primaryColor: const Color(0xff706CFF),
      secondaryHeaderColor: Colors.white,
      cardColor: const Color(0xffF2F2F2),
      scaffoldBackgroundColor: Colors.white,
      shadowColor: Colors.white,
      canvasColor: Colors.white,
      dialogBackgroundColor: const Color(0x54888888),
      hintColor: Colors.black,
      indicatorColor: const Color(0xff283349),
      dividerColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      primaryIconTheme: const IconThemeData(color: Colors.white),
      drawerTheme: const DrawerThemeData(
          scrimColor:
              Colors.transparent, //background app color when drawer opened
          surfaceTintColor: Colors.white),
      fontFamily: 'Inter',
      textTheme: const TextTheme(
          bodyLarge:
              TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          labelMedium: TextStyle(fontSize: 15, color: Colors.white)));
}
