// ignore_for_file: must_be_immutable

import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.text,
    this.widget,
    this.color,
    required this.onTap,
  });

  final double screenWidth;
  final double screenHeight;
  String? text;
  Widget? widget;
  Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? ColorsManger.orange,
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        width: screenWidth * 0.88,
        height: screenHeight * 0.062,
        child: Center(
          child: text != null ? Text(
            text!,
            style: StylesManager.bodyText4,
          ) : widget,
        ),
      ),
    );
  }
}
