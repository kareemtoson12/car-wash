import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/colors_manger.dart';
import '../Home/AboutUsScreen/AboutUs_view.dart';

Widget CustomButton(var name,ontap) {
  return ElevatedButton(
      onPressed:ontap,
      style: ElevatedButton.styleFrom(backgroundColor: ColorsManger.orange),
      child: Text(
        "$name",
        style: TextStyle(color: Colors.white),
      ));
}
