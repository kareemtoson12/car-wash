import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget NextButton(var name,gotoScreen) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 15.h,
    ),
    child: GestureDetector(
      onTap: () {
        Get.to(gotoScreen);
      },
      child: Container(
        width: 300.w,
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:ColorsManger.orange,
        ),
        child: Center(
          child: Text('$name', style: StylesManager.bodyText4),
        ),
      ),
    ),
  );
}
