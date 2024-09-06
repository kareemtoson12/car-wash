import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:clean_wash/core/widgets/NextButton.dart';
import 'package:clean_wash/core/widgets/NotificationButton.dart';
import 'package:clean_wash/features/HomePage/NaiveBar/Naivebar_view.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/Edit_profile_controller.dart';
import 'package:clean_wash/features/registration/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditProfileView extends StatelessWidget {
   EditProfileView({super.key});
  // final EditProfileView EditprofileController=Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final TextEditingController FullnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    FullnameController.text="dohaa";
    emailController.text='dohaayman@gmail.com';
    passwordController.text='123123';;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Column(
        children: [
          Stack(
            children: [
              ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height:200.h,
                    color: ColorsManger.darkblue,
                  )),
              Padding(
                padding:  EdgeInsets.all(15.0.r),
                child: Row(
                  children: [
                    Spacer(),
                    Align( alignment:Alignment.bottomLeft,child: Image.asset("images/bubble3.png",height:120.h,),),
                  ],
                ),
              ),Padding(
                padding:  EdgeInsets.only(top:50.h),
                child: Row(
                  children: [
                    // Spacer(),
                    Align( alignment:Alignment.bottomLeft,child: Image.asset("images/bubble3.png",height:120.h,),),
                  ],
                ),
              ),
              Image.asset("images/bubble3.png",height:80.h,)
              ,Padding(
                padding:EdgeInsets.fromLTRB(10.w,50.h,10.w,5.h),
                child: Row(children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon:Icon(Icons.arrow_back_ios,color: Colors.white,size:30,)),
                  // Spacer(),
                  Text("Edit Profile",style: StylesManager.headline3,),
                  Spacer(),
                ],),
              )
            ],
          ),
          SizedBox(height:10.h),
          Container(
            padding:EdgeInsets.all(10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Full Name",style:TextStyle(
                  color: Colors.black45,
                  fontSize:18.spMin,
                  fontWeight: FontWeight.bold
                )),
                CustomTextField(
                  controller: FullnameController,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  hintText: 'Full name',
                ),
                SizedBox(height:10.h),
                Text("Email",style:TextStyle(
                  color: Colors.black45,
                  fontSize:18.spMin,
                  fontWeight: FontWeight.bold
                )),
                CustomTextField(
                  controller: emailController,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  hintText: 'Email',
                ),

                SizedBox(height:10.h),

                Text("Password",style:TextStyle(
                    color: Colors.black45,
                    fontSize:18.spMin,
                    fontWeight: FontWeight.bold
                )),
                CustomTextField(
                  controller: passwordController,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height:10.h),
                NextButton("Save", NaivebarView()),
                Stack(
                  children: [
                    Align(alignment:Alignment.topRight,child: Image.asset("images/bubble3.png",height:60.h,)),
                    Align(alignment:Alignment.topRight,child: Image.asset("images/bubble3.png",height:100.h,)),

                  ],
                ),


              ],
            ),
          )

        ],
      )
    );
  }
}
