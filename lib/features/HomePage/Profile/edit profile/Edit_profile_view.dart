// ignore_for_file: must_be_immutable

import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:clean_wash/features/HomePage/NaiveBar/Naivebar_view.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/Edit_profile_controller.dart';
import 'package:clean_wash/features/HomePage/Widgets/Customtext.dart';
import 'package:clean_wash/features/registration/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

   var EditprofileController=Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final paddindtop = mediaQuery.padding.top;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorsManger.darkblue,
                          boxShadow: StylesManager.boxShadow
                      ),
                      height: 200.h,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "images/bubble3.png",
                        height: 160.h,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      "images/bubble3.png",
                      height: 80.h,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, paddindtop.h, 10.w, 5.h),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(()=>NaivebarView());
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30,
                          )),
                      // Spacer(),
                      Text(
                        "Edit Profile",
                        style: StylesManager.headline3,
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
            Obx(() {
              if (EditprofileController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (EditprofileController.userData.value == null) {
                return Center(child: Text("Error loading data"));
              }
              return Container(
                padding: EdgeInsets.all(10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Full Name",style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18.spMin,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.h),
                    Custom_Textfield(
                      controller:EditprofileController.fullnameController,
                      hintText: "Full Name",
                    ),
                    SizedBox(height: 10.h),
                    Text("Email",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18.spMin,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.h),
                    Custom_Textfield(
                      controller: EditprofileController.emailController,
                      hintText: "Email",
                    ),
                    SizedBox(height: 10.h),
                    Text("Password",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18.spMin,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.h),
                    Custom_Textfield(
                     controller:EditprofileController.passwordController,
                      hintText: "Password",
                      obscureText: true, // Adjust this as per your data
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: CustomButtom(
                        onTap: () {
                          EditprofileController.Update_data().then((_) {
                            Fluttertoast.showToast(
                              msg: "Saved",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            Navigator.of(context).pop();
                          });
                        },
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        text: 'Save',
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
    );
  }
}