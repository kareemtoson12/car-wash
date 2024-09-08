import 'package:clean_wash/features/HomePage/NaiveBar/Naivebar_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        Get.to(NaivebarView());
      }
      return user;
    } catch (e) {
      print('Error during email sign up: $e');
      return null;
    }
  }
}
