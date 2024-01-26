import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:github/common/commonExtension.dart';
import 'package:github/common/dialogs.dart';
import 'package:github/common/themeData.dart';
import 'package:github/config/constants.dart';
import 'package:go_router/go_router.dart';

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
              color: AppTheme.lightTheme.cardColor,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    //user image
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Card(
                        color: Color(0xffFF957B), //background color
                        child: Constants.userAvatar !=
                                null //show user image if it's not null
                            ? Center(
                                child: Text(
                                    Constants.userName![0].toUpperCase(),
                                    style: AppTheme
                                        .lightTheme.textTheme.labelLarge),
                              )
                            : Image.network(
                                Constants.userAvatar!,
                                fit: BoxFit.contain,
                                height: 50,
                                width: 50,
                              ),
                      ),
                    ),
                    Gap(10),
                    //user name
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
                            color: Color(0xffFF9B37),
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
              transparentDialog(context); //show loading dialog
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
