import 'package:github_signin_promax/github_signin_promax.dart';

import '../../config/constants.dart';

class LoginController {
  static Future<bool> saveGithubToken(GithubSignInResponse data) async {
    try {
      //throw exception if user not aunthenticated
      if (data.status != SignInStatus.success) {
        return false;
      }
      //save the token in locally
      Constants.githubToken = data.accessToken;
      await Constants.localStorage(
          key: 'githubtoken', value: Constants.githubToken.toString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
