import 'dart:async';
import 'package:clean_wash/features/HomePage/Widgets/CustomButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class profileController extends GetxController {
  profileController() {
    print("Constructoooor");
    get_data();
    Check_Verification();
  }

  static FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var carType = ''.obs;
  var isVerify = false.obs;

  @override
  void onInit() {
    print("proooofilee");
    super.onInit();
    get_data();
    Check_Verification();
  }

  void clearUserData() {
    userName.value = '';
    userEmail.value = '';
    carType.value = '';
    isVerify.value = false;
  }

  Future<void> get_data() async {
    if (_auth.currentUser != null) {
      var data = await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.email)
          .get();
      if (data.exists && data.data() != null) {
        userEmail.value = data.data()?['email'] ?? 'No email'; // Default value
        userName.value = data.data()?['fullName'] ?? 'No name';
        carType.value =
            data.data()?['carType'] ?? 'No car type'; // Default message
      } else {
        // Set default values if no data found
        userEmail.value = 'No email';
        userName.value = 'No name';
        carType.value = 'No car type';
        print("No data found for the current user.");
      }
      await Check_Verification();
    }
  }

  Future Check_Verification() async {
    if (_auth.currentUser != null) {
      isVerify.value = await _auth.currentUser!.emailVerified;
    }
  }

  Future Verify_Account(BuildContext context) async {
    late BuildContext verifyContext = context;
    late BuildContext loadingContext = context;
    try {
      await _auth.currentUser?.sendEmailVerification().then((value) async {
        await _auth.currentUser?.reload();

        showDialog(
            context: loadingContext,
            builder: (BuildContext loadingContext) {
              return Container(
                  color: Colors.black45,
                  height: double.infinity,
                  child: const Center(
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 7,
                          ))));
            });

        Timer(const Duration(seconds: 2), () {
          Navigator.of(context).pop(loadingContext);
          showDialog(
              context: verifyContext,
              builder: (verifyContext) {
                return AlertDialog(
                  title: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                        size: 80,
                      )),
                  contentPadding:
                      EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
                  content: Text(
                    "The verification code has been sent to your email",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Center(
                        child: CustomButton("Done", () {
                      Navigator.of(verifyContext).pop();
                    }))
                  ],
                );
              });
        });
      }).catchError((e) {
        Fluttertoast.showToast(
            msg: "$e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
