import 'package:clean_wash/features/HomePage/Services/Services_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/colors_manger.dart';
import '../Home/home_view.dart';
import '../Profile/profile_view.dart';
import 'Naivebar_controller.dart';

class NaivebarView extends StatelessWidget {
  final _controller = Get.put(Naivebar_Controller());

  static final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    ServicesView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
      ),
    );
  }
}
