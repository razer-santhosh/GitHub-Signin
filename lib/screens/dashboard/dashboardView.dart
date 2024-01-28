// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../common/commonAppBar.dart';
import '../../common/commonExtension.dart';
import '../../common/dialogs.dart';
import '../../common/drawer.dart';
import '../../common/themeData.dart';
import '../../config/constants.dart';
import 'dashboardController.dart';
import 'dashboardModel.dart';
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
    context
        .read<DashboardDataProvider>()
        .fetchInitialData(); //get github details
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
        showExitPopup(context); //show exit alert dialog
      },
      child: Scaffold(
        key: dashboardScaffoldKey,
        drawer: const AppDrawer(),
        appBar: CommonAppBar(
          title: 'Github'.hardcoded,
          leading: InkWell(
            onTap: () =>
                dashboardScaffoldKey.currentState!.openDrawer(), //open sidebar
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
              return Center(
                  child:
                      CircularProgressIndicator()); //loading indicator until data fetched
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
                      child: Text('Hi ${Constants.userName}'.hardcoded,
                          style: AppTheme.lightTheme.textTheme.labelMedium),
                    ),
                    //selected organization card widget
                    Positioned(
                      top: 50,
                      left: 18,
                      right: 18,
                      child: Container(
                        height: height * 0.15,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Constants.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(blurRadius: 2, spreadRadius: -1)
                            ]),
                      ),
                    ),
                    Positioned(
                        top: 180,
                        left: 10,
                        child: Text('Projects'.hardcoded,
                            style: AppTheme.lightTheme.textTheme.labelMedium!
                                .copyWith(color: Constants.blackColor))),
                    //project lists
                    Positioned(top: 210, child: ProjectList())
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}

//list of projects
class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.screenSize.width;
    double height = context.screenSize.height;

    List<GitRepoModel> repoList =
        context.read<DashboardDataProvider>().gitRepoList;

    Future<void> repoDetails(GitRepoModel repo) async {
      String getBranchListUrl =
          repo.branchesurl!.split('{')[0]; //split the string to get url
      List<String> branchList =
          await DashboardController.getBranchList(getBranchListUrl);
      context.push('/repo-details',
          extra: [branchList, getBranchListUrl, repo.name]);
    }

    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: repoList.isNotEmpty
          ? ListView.builder(
              itemCount: repoList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () => repoDetails(repoList[index]),
                    title: Text(repoList[index].name!), //repo name
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    leading: SizedBox(
                        height: 40,
                        width: 40,
                        child: Card(
                            color: Color(0xFFCCCCCC +
                                Random().nextInt(
                                    0x333333)), //generate random light shade colors
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text(
                                  Constants.userName![0]
                                      .toUpperCase(), //username first letter
                                  style:
                                      AppTheme.lightTheme.textTheme.labelLarge),
                            ))),
                  ),
                );
              })
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              child: Text('No projects were found...'.hardcoded)),
    );
  }
}
