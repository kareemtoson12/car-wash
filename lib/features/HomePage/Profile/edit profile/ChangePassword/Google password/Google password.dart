
// ignore_for_file: must_be_immutable

import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/ChangePassword/Google%20password/googlepassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Googlepass_view extends StatelessWidget {
  Googlepass_view({super.key});

  var controller = Get.put(googlePassController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Reset Password",
              style: StylesManager.titleText,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Enter the email associated with your account and we'll send you an email with instructions to reset your password.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 8),
              child: Text(
                "Email",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              cursorColor: Colors.indigo,
              controller: controller.emailController,
              decoration: InputDecoration(
                hintText: "yours@gmail.com",
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.resetPassword();
                    if (controller.message.isNotEmpty) {
                      Get.snackbar('Info', controller.message.value,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.black,
                          colorText: Colors.white);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    backgroundColor: ColorsManger.orange,
                  ),
                  child: Obx(() {
                    return controller.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : const Text(
                      "Send email",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
