import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class CustomTextField extends StatefulWidget {
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (widget.hintText == 'Email' && !GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    if ((widget.hintText == 'Password' ||
        widget.hintText == 'Old Password' ||
        widget.hintText == 'New Password') &&
        value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (widget.hintText == 'Full name' && value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validateInput,
      controller: widget.controller,
      style: StylesManager.bodyText3,
      cursorColor: ColorsManger.grey,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: StylesManager.bodyText3,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManger.grey),
          borderRadius: BorderRadius.circular(widget.screenWidth * 0.04),
        ),
      ),
    );
  }
}
