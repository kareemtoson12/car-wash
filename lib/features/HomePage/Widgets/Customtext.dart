import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Custom_Textfield(var controller,var hintText,var obscureText,var value){
   return TextFormField(
    controller: controller,
    style: TextStyle(
      color:hintText=='Email'?Colors.black54:Colors.black
    ),
    cursorColor: ColorsManger.grey,
    obscureText: obscureText,
    readOnly:hintText=='Email'?true:false,
    decoration: InputDecoration(
      suffixIcon: obscureText ? const Icon(Icons.remove_red_eye) : null,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManger.grey),
        borderRadius: BorderRadius.circular(15.r),
      ),
    ),
  );
}