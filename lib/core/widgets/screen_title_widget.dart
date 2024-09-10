import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Widget ScreenTitleWidget(String subTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios)),
      Padding(
        padding: EdgeInsets.only(left: 50.w),
        child: Column(children: [
          Text(
            'Standard wash',
            style: StylesManager.headline1,
          ),
          Text(
            subTitle,
            style: StylesManager.headline2,
          )
        ]),
      )
    ],
  );
}
//'Standard wash'      'pick date and time',YY