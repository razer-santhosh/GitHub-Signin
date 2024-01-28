import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../config/constants.dart';
import 'commonExtension.dart';
import 'dialogs.dart';
import 'themeData.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //variables
    double height = context.screenSize.height;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: height * 0.2,
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              color: Constants.whiteColor,
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    //user image
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Card(
                        color: Constants.orangeColor, //background color
                        child: Constants.userAvatar ==
                                null //show user image if it's not null
                            ? Center(
                                child: Text(
                                    Constants.userName![0].toUpperCase(),
                                    style: AppTheme
                                        .lightTheme.textTheme.labelLarge),
                              )
                            : Image.network(
                                Constants.userAvatar!,
                                loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? progress) =>
                                    progress != null
                                        ? CircularProgressIndicator()
                                        : child,
                                fit: BoxFit.contain,
                              ),
                      ),
                    ),
                    Gap(10),
                    //user name & company
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //username
                        Text(
                          Constants.userName ?? '',
                          style: AppTheme.lightTheme.textTheme.labelMedium!
                              .copyWith(color: Constants.blackColor),
                        ),
                        //company name if available
                        if (Constants.companyName != null)
                          Card(
                            color: Constants.orangeColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                Constants.companyName!,
                                style: AppTheme.lightTheme.textTheme.bodyMedium!
                                    .copyWith(color: Constants.whiteColor),
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          //logout button
          ListTile(
            leading: Card(
                color: Constants.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform.flip(
                    flipX: true,
                    child: const Icon(
                      Icons.logout_outlined,
                    ),
                  ),
                )),
            title: const Text('Logout'),
            onTap: () async {
              transparentLoadingDialog(context); //show loading dialog
              await Constants.storage
                  .deleteAll(); //delete all local storage data
              context.pop(); //close the loading dialog
              context.pop(); //close the drawer
              context.pushReplacement('/login'); //navigate to login page
            },
          ),
        ],
      ),
    );
  }
}
