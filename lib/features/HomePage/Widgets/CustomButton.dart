import 'package:flutter/material.dart';
import '../../../core/colors_manger.dart';

Widget CustomButton(var name,ontap) {
  return ElevatedButton(
      onPressed:ontap,
      style: ElevatedButton.styleFrom(backgroundColor: ColorsManger.orange),
      child: Text(
        "$name",
        style: TextStyle(color: Colors.white),
      ));
}
