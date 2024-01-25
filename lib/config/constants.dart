import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Constants {
  static const storage = FlutterSecureStorage();
  static localStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static String? githubToken;
  static String? userFirstName = 'Santhosh';
  static String? userLastName = 'Kumar';
}
