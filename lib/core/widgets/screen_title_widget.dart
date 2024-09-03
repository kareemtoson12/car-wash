import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: non_constant_identifier_names
Widget ScreenTitleWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      Padding(
        padding: EdgeInsets.only(left: 50.w),
        child: Column(children: [
          Text(
            'Standard wash',
            style: StylesManager.headline1,
          ),
          Text(
            'pick date and time',
            style: StylesManager.headline2,
          )
        ]),
      )
    ],
  );
}
