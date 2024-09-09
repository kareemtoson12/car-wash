import 'package:clean_wash/features/HomePage/Profile/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Naivebar_Controller extends GetxController {
  var selectedIndex = 0.obs;
  var Controller=Get.put(profileController());
  var UserName;
  var UserEmail;
  var UserCar;
@override
  void onInit() {
  print("Naivee barrr");
    // TODO: implement onInit
    super.onInit();
  UserName=FirebaseAuth.instance.currentUser!.displayName;
  Controller.get_data();
}
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}