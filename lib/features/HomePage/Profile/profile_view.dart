import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/Edit_profile_controller.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/Edit_profile_view.dart';
import 'package:clean_wash/features/HomePage/Profile/profile_controller.dart';
import 'package:clean_wash/features/HomePage/Services/Services_view.dart';
import 'package:clean_wash/features/HomePage/Widgets/CustomButton.dart';
import 'package:clean_wash/features/registration/signin/signin_controller.dart';
import 'package:clean_wash/features/registration/widgets/custom_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/styels_manger.dart';
import '../../../core/widgets/NotificationButton.dart';
import '../../map_screen/maps.dart';
import '../../map_screen/view.dart';

var settings_options = [
  {
    'icon': FaIcon(
      FontAwesomeIcons.pencil,
      color: Colors.white,
    ),
    'title': 'Edit Profile',
    'color': ColorsManger.darkblue,
    'function': () {
      Get.to(() => EditProfileView());
    }
  },
  // {
  //   'icon': FaIcon(
  //     FontAwesomeIcons.lock,
  //     color: Colors.white,
  //   ),
  //   'title': 'Change Password',
  //   'color': ColorsManger.darkblue,
  //   'function': () {
  //     Get.to(() => EditProfileView());
  //   }
  // },
  {
    'icon': FaIcon(
      FontAwesomeIcons.creditCard,
      color: Colors.white,
      size: 18,
    ),
    'title': 'Payment information',
    'color': ColorsManger.darkblue,
    'function': () {
      Get.to(() => ServicesView());
    }
  },
  {
    'icon': FaIcon(
      FontAwesomeIcons.idCard,
      color: Colors.black,
    ),
    'title': 'Loyalty club',
    'color': Colors.yellow,
    'function': () {
      Get.to(() => MapWidget());
    }
  },
  {
    'icon': FaIcon(
      FontAwesomeIcons.rightFromBracket,
      color: Colors.white,
    ),
    'title': 'Log out',
    'color': Colors.red,
    'function': () {
      Get.defaultDialog(
          title: "Log Out",
          content: const Text("Are you sure you want to log out?"),
          onCancel: () {},
          textConfirm: "Yes",
          onConfirm: () async {
            try {
              await SigninController().signOut();
            } on Exception catch (e) {}
          });
    }
  },
];

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Appbarheight = AppBar().preferredSize.height;
    var Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Profile", style: StylesManager.titleText),
          centerTitle: true,
          actions: [NotificationButton()],
        ),
        body: SingleChildScrollView(
          child: Container(
            // height:Screenheight-Appbarheight!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [HeaderWidgets(), CarTypeWidgets(), SettingsWidget()],
            ),
          ),
        ));
  }
}

Widget HeaderWidgets() {
  var ProfileView = Get.put(profileController());
  return Column(
    children: [
      Divider(),
      RPadding(
        padding: EdgeInsets.all(10.r),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/unkown.png"),
              radius: 40.r,
            ),
            SizedBox(
              width: 10.w,
            ),
            FutureBuilder(
                future: ProfileView.get_data(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print("\\\n\n\n${snapshot.error}\n\n");
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data.data()?['fullName'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                        Text(
                          snapshot.data.data()?['email'],
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                })
          ],
        ),
      ),
      Divider(),
    ],
  );
}

Widget CarTypeWidgets() {
  return Container(
    padding: EdgeInsets.all(10.r),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Car type",
          style: TextStyle(
              color: ColorsManger.darkblue,
              fontSize: 20.spMin,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 80.h,
          margin: EdgeInsets.only(top: 5.w, bottom: 5.w),
          decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Image.asset(
                "images/cartype.png",
                height: 50.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text("Coupe",
                  style: TextStyle(
                      color: ColorsManger.darkblue,
                      fontSize: 20.spMin,
                      fontWeight: FontWeight.bold)),
              Spacer(),
              CustomButton("Change", () {
                FirebaseAuth _auth = FirebaseAuth.instance;
                print("${_auth.currentUser!.email}");
              }),
              SizedBox(
                width: 20.w,
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget SettingsWidget() {
  return Container(
    padding: EdgeInsets.all(10.w),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Settings",
        style: TextStyle(
            color: ColorsManger.darkblue,
            fontSize: 20.spMin,
            fontWeight: FontWeight.bold),
      ),
      for (int i = 0; i < settings_options.length; i++)
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: InkWell(
            onTap: settings_options[i]['function'] as Function(),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: settings_options[i]['color'] as Color,
                    child: settings_options[i]['icon'] as Widget),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${settings_options[i]['title']}",
                    style: TextStyle(
                        fontSize: 16.spMin, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        )
    ]),
  );
}
