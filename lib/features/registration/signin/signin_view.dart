import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_textfield.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorsManger.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.33,
              color: ColorsManger.darkblue,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                top: screenHeight * 0.05,
                bottom: screenHeight * 0.05,
              ),
              child: SizedBox(
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Log In', style: StylesManager.headline1),
                    Text('Enter your details below to log in',
                        style: StylesManager.bodyText3),
                  ],
                ),
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                color: ColorsManger.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.05),
                  topRight: Radius.circular(screenWidth * 0.05),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  //vertical: screenHeight * 0.04,
                  horizontal: screenWidth * 0.06,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      hintText: 'Email',
                    ),
                    SizedBox(height: screenHeight * 0.032),
                    CustomTextField(
                      controller: passwordController,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: screenHeight * 0.030),
                    CustomButtom(
                      onTap: () {
                        /* AuthService().signInWithEmailAndPassword(
                          context,
                          emailController.text,
                          passwordController.text,
                        ); */
                      },
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: 'Log In',
                    ),
                    SizedBox(height: screenHeight * 0.030),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          height: 40.h,
                          'images/google_logo.svg.png',
                        ),
                        SvgPicture.asset(
                          height: 40.h,
                          'images/facebook_logo.svg',
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.030),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: StylesManager.bodyText3,
                        ),
                        GestureDetector(
                          /* onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          }, */
                          child: Text(
                            'Sign Up',
                            style: StylesManager.bodyText3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
