//Exit Dialog Start
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../config/constants.dart';

showExitPopup(BuildContext context) async {
  return await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (BuildContext builderContext, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
            scale: curve,
            child: AlertDialog(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(width: 2, color: Colors.transparent),
              ),
              content: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Do you want to exit ?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("No",
                              style: TextStyle(
                                  color: Constants.colorCode,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Gap(
                          15,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            }
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                color: Constants.colorCode,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      });
}
//Exit Dialog Ends

//Transparent Background Dialog Starts
transparentDialog(context) async {
  return await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (BuildContext builderContext, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
            scale: curve,
            child: StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(width: 2, color: Colors.transparent),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  content: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Constants.colorCode,
                      ),
                    ),
                  ));
            }));
      });
}
