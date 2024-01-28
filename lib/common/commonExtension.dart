// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this); //to get current screen size
}

extension StringExtension on String {
  String get hardcoded =>
      this; // to identify hardcoded strings through out the app

  String get stringToDate => DateFormat('dd/MM/yyyy HH:mm a')
      .format(DateTime.parse(this)); //formatted date time
}
