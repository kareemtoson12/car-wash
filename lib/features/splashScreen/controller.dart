import 'package:clean_wash/features/HomePage/NaiveBar/Naivebar_view.dart';
import 'package:clean_wash/features/registration/signin/signin_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 2), () {
      _auth.authStateChanges().listen((User? user) {
        if (user != null) {
          // Get.to(() =>MapWidget());
          Get.to(() => NaivebarView());
        } else {
          Get.to(() => SigninView());
        }
      });
    });
  }
}
