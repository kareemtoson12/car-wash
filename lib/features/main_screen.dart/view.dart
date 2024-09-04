import 'package:clean_wash/features/map_screen/maps.dart';
import 'package:clean_wash/features/map_screen/view.dart';
import 'package:clean_wash/features/pick_date_and_time/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../registration/signin/signin_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SigninView(),
      ),
    );
  }
}
