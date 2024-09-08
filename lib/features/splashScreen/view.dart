import 'package:clean_wash/features/splashScreen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(

        body: SafeArea(
            child: Center(
      child: SizedBox(
        width: double.infinity,
        child: Image.asset(
          'images/car wash app (4).png',
          fit: BoxFit.cover,
        ),
      ),
    )));
  }
}
