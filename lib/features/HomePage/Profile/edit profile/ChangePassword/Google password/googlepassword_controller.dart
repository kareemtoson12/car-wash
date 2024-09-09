import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class googlePassController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Observables
  var emailController = TextEditingController();
  var isLoading = false.obs;
  var message = ''.obs;

  Future<void> resetPassword() async {
    isLoading.value = true;
    try {
      await auth.sendPasswordResetEmail(email: emailController.text);
      message.value = "Password reset link sent! Check your email.";
    } catch (e) {
      message.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
