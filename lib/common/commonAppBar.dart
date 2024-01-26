// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:github/common/themeData.dart';
import 'package:github/config/constants.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actionWidgets;

  const CommonAppBar(
      {this.leading, this.actionWidgets, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.colorCode,
      leading: leading,
      title: Text(title, style: AppTheme.lightTheme.textTheme.bodyLarge),
      actions: actionWidgets,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
