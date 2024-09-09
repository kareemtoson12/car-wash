import 'package:clean_wash/features/HomePage/Profile/profile_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var isLoading = true.obs;  // Loading state
  var userData = Rxn<Map<String, dynamic>>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    try {
      isLoading.value = true;
      var snapshot = await _firestore.collection('Users').doc(_auth.currentUser!.email).get();
      userData.value = snapshot.data();

      if (userData.value != null) {
        fullnameController.text = userData.value!['fullName'];
        emailController.text = userData.value!['email'];
        passwordController.text = userData.value!['password']??'123456';
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> Update_data() async {
    try {
      await _firestore.collection('Users').doc(_auth.currentUser!.email).update({
        'fullName': fullnameController.text,
        // 'password': passwordController.text,
      }).then((_){
        final ProfileContr = Get.find<profileController>();
        ProfileContr.get_data();
        _auth.currentUser!.updateDisplayName(fullnameController.text);
        // _auth.currentUser!.uppdat(fullnameController.text);
      });
    } catch (e
    ) {
      print("Error updating data: $e");
    }
  }
}
