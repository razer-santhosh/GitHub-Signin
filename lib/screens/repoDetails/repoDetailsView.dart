import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/commonAppBar.dart';
import '../../common/commonExtension.dart';
import '../../common/themeData.dart';
import '../../config/constants.dart';
import 'repoDetailsModel.dart';
import 'repoDetailsProvider.dart';

class RepoDetailsView extends StatelessWidget {
  final List<String> branchList;
  final String branchDetailsUrl, repoName;

  RepoDetailsView(
      {super.key,
      required this.branchList,
      required this.branchDetailsUrl,
      required this.repoName});

  @override
  Widget build(BuildContext context) {
    double height = context.screenSize.height;

    return ChangeNotifierProvider<RepoDetailsProvider>(
      create: (context) => RepoDetailsProvider(),
      child: Scaffold(
        appBar: CommonAppBar(title: 'Project'.hardcoded),
        body: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              //purple color top area
              Container(
                height: height * 0.1,
                width: double.infinity,
                color: Constants.colorCode,
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(repoName,
                    style: AppTheme.lightTheme.textTheme.labelLarge),
              ),
              //branch list
              Consumer<RepoDetailsProvider>(builder: (context, value, child) {
                return BranchList(branchList: branchList);
              }),
              //commits list
              Consumer<RepoDetailsProvider>(builder: (context, value, child) {
                return CommitList(
                    branchName:
                        context.read<RepoDetailsProvider>().branchName ??
                            branchList[0],
                    branchDetailsUrl: branchDetailsUrl);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class BranchList extends StatelessWidget {
  final List<String> branchList;
  const BranchList({super.key, required this.branchList});

  @override
  Widget build(BuildContext context) {
    String currentBranch = context.read<RepoDetailsProvider>().branchName ??
        branchList[0]; //get initial branch name

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics:
              BouncingScrollPhysics(), //bounce effect from edge when scroll to end
          padding: EdgeInsets.all(8),
          itemCount: branchList.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: currentBranch == branchList[index]
                            ? Constants.blackColor
                            : Constants.whiteColor,
                        foregroundColor: currentBranch == branchList[index]
                            ? Constants.whiteColor
                            : Constants.blackColor),
                    onPressed: () {
                      context
                          .read<RepoDetailsProvider>()
                          .changeBranch(branchList[index]); //change branch name
                    },
                    child: Text(branchList[index])),
              )),
    );
  }
}

class CommitList extends StatelessWidget {
  final String branchName;
  final String branchDetailsUrl;
  const CommitList(
      {super.key, required this.branchName, required this.branchDetailsUrl});

  @override
  Widget build(BuildContext context) {
    RepoDetailsProvider provider = context.read<RepoDetailsProvider>();
    List<BranchCommitsModel?> branchCommitList = [];

    provider.getBranchCommit(
        provider.branchName ?? branchName, branchDetailsUrl);
    branchCommitList = provider.repoDetails;

    if (provider.dataLoading)
      return Center(child: CircularProgressIndicator());
    else
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.separated(
              separatorBuilder: ((context, index) =>
                  Divider(thickness: 0.2)), //separator
              itemCount: branchCommitList.length,
              itemBuilder: (context, index) => Card(
                      child: ListTile(
                    onTap: () {},
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(branchCommitList[index]!
                            .commit
                            .message), //commit message
                        Text(branchCommitList[index]!
                            .commit
                            .committer
                            .date
                            .stringToDate), //date
                        Row(
                          children: [
                            Icon(Icons.person_2_outlined, color: Colors.green),
                            Text(
                                branchCommitList[index]!.commit.committer.name),
                          ],
                        ), //committer name
                      ],
                    ), //commit name
                    leading: Card(
                        color: Color(0XFFFFF6EB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.folder_rounded,
                              color: Color(0XFFFFBE00)),
                        )),
                  ))),
        ),
      );
  }
}
