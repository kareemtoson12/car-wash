import 'package:clean_wash/features/HomePage/NaiveBar/Naivebar_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  var oldPassController = TextEditingController();
  var newPassController = TextEditingController();
  var confPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<Widget> checkProvide() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      for (var userInfo in user.providerData) {
        if (userInfo.providerId == 'password') {
          // return changePass(context);
        } else if (userInfo.providerId == 'google.com') {
          // return forget_pass();
        } else {
          return Center(
            child: Text('Unsupported authentication provider: ${userInfo.providerId}'),
          );
        }
      }
    }
    return Center(child: Text('No user is signed in.'));
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> updatePassword(BuildContext context) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassController.text, // This is the user's current password
        );
        await user.reauthenticateWithCredential(credential);
        await _firestore.collection('Users').doc(_auth.currentUser!.email).update({
          'password':newPassController.text,
          // 'password': passwordController.text,
        }).then((_){
          Fluttertoast.showToast(
            msg: "Password updated successfully.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Get.to(()=>NaivebarView());
          _auth.currentUser!.updatePassword(newPassController.text);
        });
      } catch (e) {
        handleError(e);
      }
    } else {
      Fluttertoast.showToast(
        msg: "No user is signed in.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void handleError(dynamic e) {
    if (e.toString() ==
        '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
      Fluttertoast.showToast(
        msg: "The old password you entered is incorrect. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (e.toString() ==
        '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.') {
      Fluttertoast.showToast(
        msg: "Something went wrong. Please try again later.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Failed to update password: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
