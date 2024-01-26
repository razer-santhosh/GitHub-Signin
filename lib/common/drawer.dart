import 'package:flutter/material.dart';
import 'package:github/common/dialogs.dart';
import 'package:github/config/constants.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff706CFF),
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Handle item 1 tap
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Handle item 2 tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
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
