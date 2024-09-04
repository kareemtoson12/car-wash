import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/features/HomePage/Widgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/styels_manger.dart';
import '../../../core/widgets/NotificationButton.dart';
var settings_options = [
  {
    'icon':FaIcon(FontAwesomeIcons.pencil,color: Colors.white,),
    'title': 'Edit Profile',
    'color':ColorsManger.darkblue,
    'Gotopage':""
  },
  {
    'icon':FaIcon(FontAwesomeIcons.creditCard,color: Colors.white,size: 18,),
    'title': 'Payment information',
    'color':ColorsManger.darkblue,
    'Gotopage':""
  },
  {
    'icon':FaIcon(FontAwesomeIcons.idCard,color: Colors.black,),
    'title': 'Loyalty club',
    'color':Colors.yellow,
    'Gotopage':""
  },
  {
    'icon':FaIcon(FontAwesomeIcons.rightFromBracket,color: Colors.white,),
    'title': 'Log out',
    'color':Colors.red,
    'Gotopage':""
  },
];
class ProfileView extends StatelessWidget {
   ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: StylesManager.titleText
          ),
          centerTitle: true,
          actions: [NotificationButton()],
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidgets(),
              CarTypeWidgets(),
              SettingsWidget()
            ],
          ),
        ));
  }
}

Widget HeaderWidgets() {
  return Column(
    children: [
      Divider(),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/promotions.jpg"),
              radius: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dohaa aymann",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "personal info",
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Divider(),
    ],
  );
}

Widget CarTypeWidgets() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Car type",
          style: TextStyle(
              color: ColorsManger.darkblue,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 100,
          margin: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Image.asset(
                "images/cartype.png",
                height: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Coupe",
                  style: TextStyle(
                      color: ColorsManger.darkblue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Spacer(),
              CustomButton("Change",()=>Text("Change")),
              SizedBox(
                width: 20,
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
    padding: EdgeInsets.all(10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings",
            style: TextStyle(
                color: ColorsManger.darkblue,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
      for(int i=0;i<settings_options.length;i++)
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Get.to(()=>settings_options[i]['Gotopage']);
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: settings_options[i]['color'] as Color,
                child:settings_options[i]['icon'] as Widget
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${settings_options[i]['title']}",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      )
    ]),
  );
}
