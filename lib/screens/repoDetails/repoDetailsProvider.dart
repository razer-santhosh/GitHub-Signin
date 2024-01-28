import 'package:flutter/material.dart';
import 'package:github/screens/repoDetails/repoDetailsController.dart';
import 'package:github/screens/repoDetails/repoDetailsModel.dart';

class RepoDetailsProvider extends ChangeNotifier {
  bool _dataLoading = true;
  bool get dataLoading => _dataLoading;

  String? _currentBranch;
  String? get branchName => _currentBranch;

  changeBranch(String newBranch) {
    _currentBranch = newBranch;
    notifyListeners();
  }

  List<BranchCommitsModel?> _repoDetails = [];
  List<BranchCommitsModel?> get repoDetails => _repoDetails;

  getBranchCommit(String branchName, String branchUrl) async {
    _repoDetails =
        await RepoDetailsController.getCommitsDetails(branchName, branchUrl);
    _dataLoading = false;
    notifyListeners();
  }
}
