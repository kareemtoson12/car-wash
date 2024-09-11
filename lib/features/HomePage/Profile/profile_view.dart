import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/ChangePassword/changepasswordhome.dart';
import 'package:clean_wash/features/HomePage/Profile/edit%20profile/Edit_profile_view.dart';
import 'package:clean_wash/features/HomePage/Profile/profile_controller.dart';
import 'package:clean_wash/features/HomePage/Services/Services_view.dart';
import 'package:clean_wash/features/HomePage/Widgets/CustomButton.dart';
import 'package:clean_wash/features/registration/car_type/car_type_view.dart';
import 'package:clean_wash/features/registration/signin/signin_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../core/styels_manger.dart';
import '../../../core/widgets/NotificationButton.dart';
import '../../map_screen/maps.dart';

var Controller = Get.put(profileController());
var x = profileController();
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
  {
    'icon': FaIcon(
      FontAwesomeIcons.lock,
      color: Colors.white,
    ),
    'title': 'Change Password',
    'color': ColorsManger.darkblue,
    'function': () {
      Get.to(() => changepasshome());
    }
  },
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
      Get.to(() => MapWidget(
            activeSteep: 1,
          ));
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
              // Get.find<profileController>().clearUserData();
            } on Exception {}
          });
    }
  },
];

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Profile", style: StylesManager.titleText),
          centerTitle: true,
          actions: [NotificationButton()],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidgets(context),
                CarTypeWidgets(),
                SettingsWidget()
              ],
            ),
          ),
        ));
  }
}

Widget HeaderWidgets(BuildContext context) {
  return Obx(() {
    return Column(
      children: [
        Divider(),
        RPadding(
          padding: EdgeInsets.all(10.r),
          child: Row(children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/unkown.png"),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Controller.userName.value, // This should update automatically
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                Text(
                  Controller.userEmail.value,
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            !Controller.isVerify.value
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: CustomButton("Verify Email", () {
                      Controller.Verify_Account(context);
                    }))
                : SizedBox.shrink(),
          ]),
        ),
        Divider(),
      ],
    );
  });
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
          child: Obx(
            () {
              return Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Car_Type(),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text("${Controller.carType.value}",
                      style: TextStyle(
                          color: ColorsManger.darkblue,
                          fontSize: 20.spMin,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  CustomButton("Change", () {
                    FirebaseAuth _auth = FirebaseAuth.instance;
                    print("${_auth.currentUser!.email}");
                    // print("${Controller.carType}");
                    print("${Controller.isVerify.value}");
                    print("${_auth.currentUser!.emailVerified}");
                    Get.to(() => CarTypeView());
                  }),
                  SizedBox(
                    width: 20.w,
                  )
                ],
              );
            },
          ),
        )
      ],
    ),
  );
}

Widget Car_Type() {
  switch (Controller.carType.value) {
    case 'Coupe':
      return Image.asset(
        "images/coupe.png",
        height: 30.h,
      );
    case 'Sedan':
      return Image.asset(
        "images/sedan.png",
        height: 30.h,
      );
    case 'Micro':
      return Image.asset(
        "images/micro.png",
        height: 30.h,
      );
    case 'Hatchback':
      return Image.asset(
        "images/hatchback.png",
        height: 30.h,
      );
    case 'Sport':
      return Image.asset(
        "images/sport.png",
        height: 30.h,
      );
    case 'Van':
      return Image.asset(
        "images/van.png",
        height: 30.h,
      );
    default:
      return const SizedBox
          .shrink(); // Returns an empty widget if no case matches
  }
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
