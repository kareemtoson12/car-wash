import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StylesManager {
  // Define text styles
  static TextStyle headline1 = TextStyle(
    fontSize: 25.0.sp,
    fontWeight: FontWeight.bold,
    color: Colors.blue[900],
  );

  static TextStyle headline2 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static TextStyle bodyText1 = TextStyle(
    fontSize: 17.0.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle bodyText2 = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
  static TextStyle bodyText3 = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  // Define color palette
  static const Color primaryColor = Color(0xFF6200EA);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFFF6F6F6);
  static const Color accentColor = Color(0xFFFF5722);

  // Define padding values
  static const EdgeInsets defaultPadding = EdgeInsets.all(16.0);
  static const EdgeInsets smallPadding = EdgeInsets.all(8.0);
  static const EdgeInsets largePadding = EdgeInsets.all(32.0);

  // Define border radius
  static const BorderRadius defaultBorderRadius = BorderRadius.all(
    Radius.circular(8.0),
  );

  // Define box shadows
  static const List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 4.0,
      offset: Offset(2.0, 2.0),
    ),
  ];
}
