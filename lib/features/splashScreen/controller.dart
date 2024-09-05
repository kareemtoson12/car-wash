import 'package:clean_wash/features/registration/signin/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 3), () {
      Get.to(SigninView());
    });
  }
}
