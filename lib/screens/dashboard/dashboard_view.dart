// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:github/common/commonAppBar.dart';
import 'package:github/config/constants.dart';

import '../../common/commonExtension.dart';
import '../../common/drawer.dart';
import '../../common/themeData.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> dashboardScaffoldKey = GlobalKey<ScaffoldState>();
    //variable decalration starts
    double height = context.screenSize.height;
    // double width = context.screenSize.width;
    //variable decalration ends

    return Scaffold(
      key: dashboardScaffoldKey,
      drawer: const AppDrawer(),
      appBar: CommonAppBar(
        title: 'Github',
        leading: InkWell(
          onTap: () => dashboardScaffoldKey.currentState!.openDrawer(),
          child: Icon(Icons.menu_outlined,
              color: AppTheme.lightTheme.secondaryHeaderColor),
        ),
        actionWidgets: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Transform.rotate(
              angle: 0.523,
              child: Icon(Icons.notifications_none_outlined,
                  color: AppTheme.lightTheme.secondaryHeaderColor),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            //purple color top area
            Container(
              height: height * 0.15,
              width: double.infinity,
              color: AppTheme.lightTheme.primaryColor,
            ),
            //greeting user widget
            Positioned(
              top: 10,
              left: 18,
              child: Text('Hi ${Constants.userFirstName}',
                  style: AppTheme.lightTheme.textTheme.labelMedium),
            ),
            //selected organization card widget
            Positioned(
              top: 50,
              left: 18,
              right: 18,
              child: Container(
                height: height * 0.2,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppTheme.lightTheme.secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(blurRadius: 5, spreadRadius: -1)
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
