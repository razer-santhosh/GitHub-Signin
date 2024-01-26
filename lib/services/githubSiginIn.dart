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

  @override
  Widget build(BuildContext context) {
    return GithubSigninScreen(
      params: params,
    );
  }
}
