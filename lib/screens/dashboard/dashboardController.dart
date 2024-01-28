import 'dart:convert';

import 'package:http/http.dart';

import '/common/commonExtension.dart';
import '../../config/constants.dart';
import '../../services/apiCalls.dart';
import 'dashboardModel.dart';

class DashboardController {
  //fetch user initial data from github
  static Future<DashboardDataModel?> getUserInitialData() async {
    DashboardDataModel userData = DashboardDataModel();
    try {
      //trigger API call to github for fetch user details
      Response response =
          await API.getData('user'.hardcoded, Constants.githubToken!);
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        userData = DashboardDataModel.fromJson(
            body); //convert the details into model data
      }
      return userData;
    } catch (e) {
      return null;
    }
  }

  //fetch list of repo user have
  static Future<List<GitRepoModel>> getRepoList(String repoUrl) async {
    List<GitRepoModel> repoList = [];
    try {
      //trigger API call to github for fetch user repo list
      Response response = await API.getGitData(repoUrl, Constants.githubToken!);
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        for (Map<String, dynamic> item in body) {
          repoList.add(GitRepoModel.fromJson(item));
        }
      }
      return repoList;
    } catch (e) {
      return repoList;
    }
  }

  //fetch list of branhces in the repo
  static Future<List<String>> getBranchList(String branchListUrl) async {
    List<String> branchList = [];
    try {
      //trigger API call to github for branch list from repo
      Response response =
          await API.getGitData(branchListUrl, Constants.githubToken!);
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        for (Map<String, dynamic> item in body) {
          branchList.add(item['name']);
        }
      }
      return branchList;
    } catch (e) {
      return branchList;
    }
  }
}
