import 'package:clean_wash/core/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Custom_Textfield({
  required TextEditingController controller,
  required String hintText,
  bool obscureText = false,
  TextEditingController? newPasswordController,
}) {
  // Validation function
  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (hintText == 'Email' && !GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    if ((hintText == 'Password' ||
        hintText == 'Old Password' ||
        hintText == 'New Password') &&
        value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (hintText == 'Confirm Password' && newPasswordController != null) {
      if (value != newPasswordController.text) {
        return 'Confirm Password does not match New Password';
      }
    }
    if (hintText == 'Full name' && value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }

  return TextFormField(
    controller: controller,
    style: TextStyle(
      color: hintText == 'Email' ? Colors.black54 : Colors.black,
    ),
    cursorColor: ColorsManger.grey,
    obscureText: obscureText,
    readOnly: hintText == 'Email'||hintText=='Password' ? true : false,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon: obscureText ? const Icon(Icons.lock) : null,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManger.grey),
        borderRadius: BorderRadius.circular(15.r),
      ),
    ),
    validator: _validateInput, // Apply the validation function
  );
}
