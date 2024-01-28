import 'package:flutter/widgets.dart';

import '../../config/constants.dart';
import 'dashboardController.dart';
import 'dashboardModel.dart';

class DashboardDataProvider extends ChangeNotifier {
  bool _dataLoading = true;
  bool get dataLoading => _dataLoading;

  List<GitRepoModel> _gitRepoList = [];
  List<GitRepoModel> get gitRepoList => _gitRepoList;

  fetchInitialData() async {
    DashboardDataModel? data = await DashboardController.getUserInitialData();
    if (data != null) {
      Constants.userName = data.name;
      Constants.userAvatar = data.avatarurl;
      _gitRepoList = await DashboardController.getRepoList(data.reposurl!);
    }
    _dataLoading = false;
    notifyListeners();
  }
}
