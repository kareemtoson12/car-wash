import 'package:clean_wash/features/HomePage/NaiveBar/Naivebar_view.dart';
import 'package:clean_wash/features/HomePage/Profile/profile_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CarTypeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var selectedCarType = ''.obs;

  void changeCarType(String value) {
    selectedCarType.value = value;
  }

  void saveCarType() async {
    await _firestore.collection('Users').doc(_auth.currentUser!.email).update({
      'carType': selectedCarType.value,
    });
    final ProfileContr = Get.find<profileController>();
    ProfileContr.get_data();
    Get.to(NaivebarView());
  }
}
