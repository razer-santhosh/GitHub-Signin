// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/commonAppBar.dart';
import '../../common/commonExtension.dart';
import '../../common/dialogs.dart';
import '../../common/drawer.dart';
import '../../common/themeData.dart';
import '../../config/constants.dart';
import 'dashboardProvider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> dashboardScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<DashboardDataProvider>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //variable decalration starts
    double height = context.screenSize.height;
    // double width = context.screenSize.width;
    //variable decalration ends

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showExitPopup(context);
      },
      child: Scaffold(
        key: dashboardScaffoldKey,
        drawer: const AppDrawer(),
        appBar: CommonAppBar(
          title: 'Github',
          leading: InkWell(
            onTap: () => dashboardScaffoldKey.currentState!.openDrawer(),
            child: Icon(Icons.menu_outlined, color: Constants.whiteColor),
          ),
          actionWidgets: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Transform.rotate(
                angle: 0.523,
                child: Icon(Icons.notifications_none_outlined,
                    color: Constants.whiteColor),
              ),
            )
          ],
        ),
        body: Consumer<DashboardDataProvider>(
          builder: (context, dataProvider, child) {
            if (dataProvider.dataLoading)
              return Center(child: CircularProgressIndicator());
            else
              return SizedBox(
                height: double.infinity,
                child: Stack(
                  children: [
                    //purple color top area
                    Container(
                      height: height * 0.15,
                      width: double.infinity,
                      color: Constants.colorCode,
                    ),
                    //greeting user widget
                    Positioned(
                      top: 10,
                      left: 18,
                      child: Text('Hi ${Constants.userName}',
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
                            color: Constants.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(blurRadius: 5, spreadRadius: -1)
                            ]),
                      ),
                    ),
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}
