import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget NotificationButton(gotoScreen){
  return IconButton(
      onPressed: () {
        Get.to(gotoScreen);
      },
      icon: Icon(
        Icons.notifications,
        size: 35,
      ));
}