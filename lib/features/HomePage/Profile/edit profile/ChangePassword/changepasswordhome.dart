import 'package:clean_wash/features/HomePage/Profile/edit%20profile/ChangePassword/changepasshome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class changepasshome extends StatelessWidget {
   changepasshome({super.key});
  var Controller=Get.put(changepasshome_controller());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: Controller.checkProvide(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (snapshot.hasData) {
          return snapshot.data!;
        } else {
          return Scaffold(
            body: Center(child: Text('Something went wrong.')),
          );
        }
      },
    );
  }
}
