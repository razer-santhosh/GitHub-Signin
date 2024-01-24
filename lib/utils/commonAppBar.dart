// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CommonAppBar extends StatefulWidget {

  final Widget? leading;
  final String title; 

  const CommonAppBar({this.leading,required this.title,super.key});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CircleAvatar(child: widget.leading ?? const Icon(Icons.notes_outlined)),
      title: Text(widget.title),
    );
  }
}