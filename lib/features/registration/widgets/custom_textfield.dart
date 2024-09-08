import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: StylesManager.bodyText3,
      cursorColor: ColorsManger.grey,
      keyboardType: TextInputType.visiblePassword,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: StylesManager.bodyText3,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  if (widget.obscureText) {
                    setState(() {
                      widget.obscureText == false;
                    });
                  } else {
                    setState(() {
                      widget.obscureText == true;
                    });
                  }
                },
                icon: const Icon(Icons.remove_red_eye))
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManger.grey),
          borderRadius: BorderRadius.circular(widget.screenWidth * 0.04),
        ),
      ),
    );
  }
}
