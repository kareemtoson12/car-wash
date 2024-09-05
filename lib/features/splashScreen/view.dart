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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'images/splash.png',
                    fit: BoxFit.cover, // Makes the image cover the full screen
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
