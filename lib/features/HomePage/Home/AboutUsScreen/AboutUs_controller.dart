import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AboutUsController extends GetxController {

  final PageController pageController = PageController();
  var currentPage = 0.obs;

  final List<Map<String, String>> pages = [
    {
      'image': 'images/img_1.png',
      'title': 'Convenient Car Care \nat Your Fingertips:',
      'description':
      'At our Car wash app, we understand the importance of convenience in your busy life. We have developed a user-friendly mobile application that allows you to schedule and manage your car wash appointments with just a few taps on your phone.',
    },
    {
      'image': 'images/car1.jpg',
      'title': 'Unmatched Quality \nand Attention to Detail:',
      'description':
      'We pride ourselves on delivering an exceptional car wash experience with unmatched quality and attention to detail. Our team of trained professionals uses the latest techniques and eco-friendly products to ensure that your vehicle receives the care it deserves.',
    },
    {
      'image': 'images/car2.jpg',
      'title': 'Customizable Services\n to Suit Your Needs:',
      'description':
      'Every car has unique needs, which is why our car wash app offers customizable services to suit your specific requirements. Whether you need a quick exterior wash or a comprehensive package that includes waxing, polishing, and interior detailing, our app allows you to select the services that best fit your needs and budget.',
    },
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
