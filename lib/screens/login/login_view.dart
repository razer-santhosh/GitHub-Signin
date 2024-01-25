import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:github_signin_promax/github_signin_promax.dart';
import 'package:go_router/go_router.dart';

import '../../config/constants.dart';
import '../../config/images.dart';
import '../../common/themeData.dart';
import '../../common/commonExtension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //variable decalration starts
    double height = context.screenSize.height;
    double width = context.screenSize.width;
    //variable decalration ends

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(AppImages.githubLogo, fit: BoxFit.contain),
              Column(
                children: [
                  Image.asset(AppImages.systemPhoneImage, fit: BoxFit.contain),
                  const Gap(20),
                  Text('Let\'s built from here ...'.hardcoded,
                      style: AppTheme.lightTheme.textTheme.bodyMedium),
                  const Gap(10),
                  Text(
                      'Our platform drives innovation with tools that boost developer velocity'
                          .hardcoded,
                      style: AppTheme.lightTheme.textTheme.bodySmall),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.push('/github-sign-in').then((value) async {
                    try {
                      if (value != null) {
                        GithubSignInResponse data =
                            value as GithubSignInResponse;
                        // if (data.accessToken != null)
                        // {
                        // Constants.localStorage('githubtoken'.hardcoded, data.accessToken!);
                        Constants.githubToken = data.accessToken;
                        // }
                      }
                    } catch (e) {
                      null;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.lightTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text('Sign in with Github'.hardcoded,
                    style: AppTheme.lightTheme.textTheme.labelMedium),
              )
            ],
          ),
        ),
      ),
    );
  }
}