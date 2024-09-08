import 'package:clean_wash/features/HomePage/NaiveBar/Naivebar_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccountController extends GetxController {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

  Future<User?> signUpWithEmailAndPassword() async {
    try {
      if (passwordController.text != repeatPasswordController.text) {
        Get.snackbar('Error', 'Passwords do not match');
        return null;
      }

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      User? user = userCredential.user;

      if (user != null) {
        if (user.email != null) {
          await _firestore.collection('Users').doc(user.email).set({
            'email': user.email,
            'password': passwordController.text,
            'fullName': fullNameController.text,
            'createdAt': FieldValue.serverTimestamp(),
          });
          _auth.currentUser!.updateDisplayName(fullNameController.text);
          Get.to(() => NaivebarView());
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
