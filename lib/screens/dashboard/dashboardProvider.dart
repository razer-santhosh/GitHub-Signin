import 'package:flutter/widgets.dart';
import 'package:github/config/constants.dart';
import 'package:github/screens/dashboard/dashboardController.dart';
import 'package:github/screens/dashboard/dashboardModel.dart';

class DashboardDataProvider extends ChangeNotifier {
  bool _dataLoading = true;

  bool get dataLoading => _dataLoading;

  fetchData() async {
    DashboardModel? data = await DashboardController.getUserInitialData();
    if (data != null) {
      Constants.userName = data.name;
      Constants.userAvatar = data.avatarurl;
    }
    _dataLoading = false;
    notifyListeners();
  }
}
