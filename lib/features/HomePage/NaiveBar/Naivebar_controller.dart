import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Naivebar_Controller extends GetxController {
  var selectedIndex = 0.obs;
  // var Controller=Get.put(Home)
  var UserName=FirebaseAuth.instance.currentUser!.displayName;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}