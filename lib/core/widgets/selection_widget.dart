// ignore_for_file: non_constant_identifier_names

import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';

Widget SelectionWidget(String topName, String bottomName) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        topName,
        style: StylesManager.bodyText1,
      ),
      Text(
        bottomName,
        style: StylesManager.bodyText2,
      ),
    ],
  );
}
