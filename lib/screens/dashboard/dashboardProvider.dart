import 'package:flutter/widgets.dart';

import '../../config/constants.dart';
import 'dashboardController.dart';
import 'dashboardModel.dart';

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
