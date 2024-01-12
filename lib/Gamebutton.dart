// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

Widget Gamebutton(void Function()? onTap, String ImagePath, double width) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(
      ImagePath,
      width: width,
    ),
  );
}