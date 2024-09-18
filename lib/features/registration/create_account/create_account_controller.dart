import 'package:clean_wash/features/HomePage/NaiveBar/Naivebar_view.dart';
import 'package:clean_wash/features/HomePage/Profile/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccountController {
   static FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // إضافة Firestore
   final formKey = GlobalKey<FormState>();
   Future<User?> signUpWithEmailAndPassword(
    BuildContext context, String email, String password, String fullName) async {
  try {
    UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    if (user != null) {
      if (user.email != null) {
        await _firestore.collection('Users').doc(user.email).set({
          'email': user.email,
          'password':password,
          'fullName' : fullName,
          'createdAt': FieldValue.serverTimestamp(),
        });
        Get.find<profileController>().get_data();
        _auth.currentUser!.updateDisplayName(fullName);
        Get.to(NaivebarView());
      } else {
        print("Error: User email is null.");
      }
    }
    return user;
  } catch (e) {
    print('Error during email sign up: $e');
    return null;
  }
}
}
