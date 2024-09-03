
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/colors_manger.dart';
import '../Home/home_view.dart';
import 'homepage_Controller.dart';

class HomePage extends StatelessWidget {
  final _controller = Get.put(homepageController());

  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    Text('Services'),
    Text('Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
                () => _widgetOptions.elementAt(_controller.selectedIndex.value)),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        backgroundColor: ColorsManger.darkblue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart_outlined),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _controller.selectedIndex.value,
        selectedItemColor: Colors.white,
        onTap: _controller.onItemTapped,
      )),
    );
  }
}