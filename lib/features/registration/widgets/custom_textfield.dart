import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final double screenHeight;
  final double screenWidth;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: StylesManager.bodyText3,
      cursorColor: ColorsManger.grey,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: StylesManager.bodyText3,
        suffixIcon: obscureText ? const Icon(Icons.remove_red_eye) : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManger.grey),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: ColorsManger.grey),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManger.grey),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
      ),
    );
  }
}
