import 'package:clean_wash/features/HomePage/Profile/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Naivebar_Controller extends GetxController {
  Naivebar_Controller() {
    Controller.get_data();
  }
  var selectedIndex = 0.obs;
  var Controller = Get.put(profileController());
  var UserName = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    UserName = Controller.userName;
    UserName.value = FirebaseAuth.instance.currentUser?.displayName ?? 'Guest';
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
