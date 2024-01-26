import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:github/common/themeData.dart';

class Constants {
  static const storage = FlutterSecureStorage();
  static localStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static String? githubToken;
  static String? userFirstName = 'Santhosh';
  static String? userLastName = 'Kumar';
  static Color colorCode = AppTheme.lightTheme.primaryColor;
  static Color secondaryColorCode = AppTheme.lightTheme.secondaryHeaderColor;
}
