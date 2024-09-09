import 'package:clean_wash/core/styels_manger.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/ChangePassword/Google%20password/Google%20password.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/ChangePassword/User%20password/change_pass_controller.dart';
import 'package:clean_wash/features/HomePage/Widgets/CustomButton.dart';
import 'package:clean_wash/features/HomePage/Widgets/Customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatelessWidget {
  final ChangePasswordController controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Text('Password Change',style:StylesManager.titleText,),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Custom_Textfield(obscureText: true,hintText:"Old Password", controller:controller.oldPassController,),
              Align(
                alignment: Alignment.topRight,
                child:TextButton(onPressed:  (){
                  Get.to(()=>Googlepass_view());
                }, child: Text("Forgot Password?"))
              ),
              Custom_Textfield(obscureText: true,hintText: "New Password",controller:controller.newPassController),
              const SizedBox(height: 16),
              Custom_Textfield(
                hintText: "Confirm Password",
                controller:controller.confPassController,
                newPasswordController: controller.newPassController,
                obscureText: true
              ),
              const SizedBox(height: 16),
              CustomButton(
                "SAVE PASSWORD",
                    () async {
                  if (controller.formKey.currentState!.validate()) {
                    await controller.updatePassword(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
