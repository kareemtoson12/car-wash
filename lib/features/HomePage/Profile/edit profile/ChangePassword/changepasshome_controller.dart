import 'package:clean_wash/features/HomePage/Profile/edit%20profile/ChangePassword/Google%20password/Google%20password.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/ChangePassword/User%20password/change_pass_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class changepasshome_controller extends GetxController{

  Future<Widget> checkProvide() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      for (var userInfo in user.providerData) {
        if (userInfo.providerId == 'password') {
          return ChangePasswordPage();
        } else if (userInfo.providerId == 'google.com') {
          return Googlepass_view();
        } else {
          return Center(
            child: Text('Unsupported authentication provider: ${userInfo.providerId}'),
          );
        }
      }
    }
    return Center(child: Text('No user is signed in.'));
  }
}