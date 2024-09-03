// ignore_for_file: non_constant_identifier_names

import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';

Widget SelectionWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Select your date and time ',
        style: StylesManager.bodyText1,
      ),
      Text(
        'Select days when wash is available',
        style: StylesManager.bodyText2,
      ),
    ],
  );
}
