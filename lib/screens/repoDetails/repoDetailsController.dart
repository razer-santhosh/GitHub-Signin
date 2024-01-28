import 'dart:convert';

import 'package:http/http.dart';

import '../../config/constants.dart';
import '../../services/apiCalls.dart';
import 'repoDetailsModel.dart';

class RepoDetailsController {
  //get repo
  static Future<List<BranchCommitsModel?>> getCommitsDetails(
      String branchName, String branchUrl) async {
    List<BranchCommitsModel?> branchCommitDetails = [];
    try {
      //trigger API call to github for branch list from repo
      Response response = await API.getGitData(
          '$branchUrl/$branchName', Constants.githubToken!);
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        branchCommitDetails.add(BranchCommitsModel.fromJson(body));
      }
      return branchCommitDetails;
    } catch (e) {
      return branchCommitDetails;
    }
  }
}
