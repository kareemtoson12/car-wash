import 'package:clean_wash/features/HomePage/NaiveBar/Naivebar_view.dart';
import 'package:clean_wash/features/onboarding/view.dart';
import 'package:clean_wash/features/registration/create_account/create_account_view.dart';
import 'package:clean_wash/features/registration/signin/signin_view.dart';
import 'package:clean_wash/features/splashScreen/view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      child: GetMaterialApp(
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: CreateAccountView(),
      ),
    );
  }
}
