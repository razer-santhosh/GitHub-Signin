// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:github_signin_promax/github_signin_promax.dart';

import '../env/env.dart';

class GitHubSignIn extends StatelessWidget {
  GitHubSignIn({super.key});

  final params = GithubSignInParams(
    clientId: Env.clientId,
    clientSecret: Env.clientSecret,
    redirectUrl: Env.githubRedirectUrl,
    scopes: 'read:user,user:email,repo,read:org',
  );

  // var params = GithubSignInParams(
  //   clientId: '78e934c70db313a3ec9b',
  //   clientSecret: '74a8f1dbcd5a1fac59516969bb874e634faf666b',
  //   redirectUrl: 'http://localhost:3000/auth/github/callback',
  //   scopes: 'read:user,user:email',
  // );

  @override
  Widget build(BuildContext context) {
    return GithubSigninScreen(
      params: params,
    );
  }
}
