import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../common/themeData.dart';

class Constants {
  static const storage = FlutterSecureStorage();
  static Future<void> localStorage(
      {required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  static String? githubToken, userName, userAvatar, companyName;
  static Color colorCode = AppTheme.lightTheme.primaryColor,
      whiteColor = Colors.white,
      blackColor = Colors.black;
}
