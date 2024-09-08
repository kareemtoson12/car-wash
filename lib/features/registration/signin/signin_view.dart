import 'package:flutter_svg/flutter_svg.dart';
import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:clean_wash/features/registration/create_account/create_account_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_textfield.dart';
import 'signin_controller.dart';

class SigninView extends StatelessWidget {
  final SigninController controller = Get.put(SigninController());

  SigninView({super.key});

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
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    top: screenHeight * 0.15,
                    bottom: screenHeight * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign In to your account',
                          style: StylesManager.headline3),
                      Text('Welcome back!', style: StylesManager.bodyText5),
                      Text('Select method to log in',
                          style: StylesManager.bodyText5),
                    ],
                  ),
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
                  vertical: screenHeight * 0.04,
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
                        controller.signInWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      text: 'Log In',
                    ),
                    SizedBox(height: screenHeight * 0.030),
                    Text(
                      'or login with',
                      style: StylesManager.bodyText3,
                    ),
                    SizedBox(height: screenHeight * 0.030),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.signInWithGoogle();
                          },
                          child: Image.asset(
                            height: 40,
                            'images/google_logo.svg.png',
                          ),
                        ),
                        SvgPicture.asset(
                          height: 40,
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
                          onTap: () {
                            Get.to(CreateAccountView());
                          },
                          child: Text(
                            'Sign Up',
                            style: StylesManager.bodyText6,
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
