import 'dart:convert';

import 'package:github/config/constants.dart';
import 'package:github/screens/dashboard/dashboardModel.dart';
import 'package:github/services/apiCalls.dart';
import 'package:http/http.dart';

class DashboardController {
  static Future<DashboardModel?> getUserInitialData() async {
    DashboardModel userData = DashboardModel();
    try {
      Response response = await API.getData('user', Constants.githubToken);
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        userData = DashboardModel.fromJson(body);
      }
      return userData;
    } catch (e) {
      return null;
    }
  }
}
