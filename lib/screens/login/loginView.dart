import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:github_signin_promax/github_signin_promax.dart';
import 'package:go_router/go_router.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../common/dialogs.dart';
import '../../config/constants.dart';
import '../../config/images.dart';
import '../../common/themeData.dart';
import '../../common/commonExtension.dart';
import 'loginController.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //variable decalration starts
    double height = context.screenSize.height;
    double width = context.screenSize.width;
    RoundedLoadingButtonController signInButtonController =
        RoundedLoadingButtonController();
    //variable decalration ends

    //github authentication
    void githubSignIn() {
      context.push('/github-sign-in').then((value) async {
        print('res - $value');
        //return back from github signin page
        GithubSignInResponse? data =
            value != null ? value as GithubSignInResponse : null;
        if (data != null && data.status == SignInStatus.success) {
          //save token locally
          bool response = await LoginController.saveGithubToken(data);
          //handle response
          if (response) {
            signInButtonController.success();
            //redirect to dashboard
            Future.delayed(const Duration(seconds: 1), () {
              context.pushReplacement('/dashboard');
            });
          } else {
            signInButtonController.error();
          }
        } else {
          signInButtonController.error();
        }
        Future.delayed(const Duration(seconds: 1), () {
          signInButtonController.reset();
        });
      });
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showExitPopup(context);
      },
      child: Scaffold(
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
                    Image.asset(AppImages.systemPhoneImage,
                        fit: BoxFit.contain),
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
                RoundedLoadingButton(
                  controller: signInButtonController,
                  borderRadius: 10,
                  color: Constants.colorCode,
                  onPressed: () {
                    githubSignIn();
                  },
                  child: Text('Sign in with Github'.hardcoded,
                      style: AppTheme.lightTheme.textTheme.labelMedium),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
