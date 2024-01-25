
// ignore_for_file: file_names

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool _connectivity = false;

  bool get connectivity => _connectivity;

  checkConnectivity() {
    Connectivity().onConnectivityChanged.listen((result){
      _connectivity = result == ConnectivityResult.none ? false : true;
      notifyListeners();
    });
  }
}