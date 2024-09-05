import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();

  var currentPage = 0.obs;

  final List<String> onboardingTexts = [
    'Get your car washed at your convenience!',
    'Professional and eco-friendly car wash service.',
    'Save time with our quick and efficient process.',
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
