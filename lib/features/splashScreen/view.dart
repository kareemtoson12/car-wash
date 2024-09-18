import 'package:clean_wash/features/splashScreen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor:Color(0xffDFE1D4),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Color(0xffDFE1D4),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                'images/car wash app (4).png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
