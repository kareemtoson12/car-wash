import 'package:clean_wash/features/pick_date_and_time/view.dart';
import 'package:clean_wash/features/pick_date_and_time/widgets/time_selection_widget.dart';
import 'package:clean_wash/features/registration/signin/signin_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../map_screen/maps.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 2), () {
      _auth.authStateChanges().listen((User? user) {
        if (user != null) {
          Get.to(() =>MapWidget());
        } else {
          Get.to(() => SigninView());
        }
      });
    });
  }
}
