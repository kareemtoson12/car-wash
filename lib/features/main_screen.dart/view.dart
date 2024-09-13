import 'package:clean_wash/features/Payment/payment_view.dart';
import 'package:clean_wash/features/registration/signin/signin_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../splashScreen/view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
        designSize: Size(360, 690),
        child: GetMaterialApp(
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            // home: MapWidget()
            home: SplashView()));
  }
}
