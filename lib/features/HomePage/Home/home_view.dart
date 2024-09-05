import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/colors_manger.dart';
import '../../registration/signin/signin_view.dart';
import '../Widgets/CustomButton.dart';
import 'AboutUsScreen/AboutUs_view.dart';

var features = [
  {
    'image': 'images/car wash 2.jpg',
    'title': 'Exterior',
  },
  {
    'image': 'images/interior.jpg',
    'title': 'Interior',
  },
  {
    'image': 'images/car wash 1.jpg',
    'title': 'Detailing',
  },
  {
    'image': 'images/car wash 3.jpg',
    'title': 'Tyre Wash',
  },
  {
    'image': 'images/interior.jpg',
    'title': 'Polish',
  },
];

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 12, 15, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height:10.h,
                          ),
                          Features_services(),
                          appointment(),
                          SizedBox(
                            height: 10,
                          ),
                          Promotions(),
                          SizedBox(
                            height: 10,
                          ),
                          About_us(),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
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

Widget Header() {
  return Stack(
    children: [
      ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 210,
            color: ColorsManger.orange,
          )),
      ClipPath(
        clipper: WaveClipperTwo(),
        child: ImageFiltered(
    imageFilter: ImageFilter.blur(sigmaX: 2.0, sigmaY:3.0), // Adjust the blur intensity here
          child: Container(
              height: 200,
              decoration: BoxDecoration(
                color:ColorsManger.darkblue,
                  // image: DecorationImage(
                // image: AssetImage("images/bubbles 2.jpg"),
                // fit: BoxFit.cover,)

              ),)
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(15, 12, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dohaa aymann",
                  style: TextStyle(
                      color: ColorsManger.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      size: 35,
                      color: ColorsManger.white,
                    ))
              ],
            ),
            Text(
              "A clean Car is a\nhappy car!",
              style: TextStyle(
                  color: ColorsManger.white,
                  fontWeight: FontWeight.bold,
                  fontSize:30.sp),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50.h, // make this responsive as well
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorsManger.white,
                border: Border.all(width: 1.w, color: Colors.grey),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: TextFormField(
                textAlign: TextAlign.start, // Align text to center
                decoration: InputDecoration(
                  hintText: "Search..",
                  fillColor: ColorsManger.white,
                  prefixIcon: Icon(Icons.search, size: 20.sp),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h), // Adjust the padding
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget Features_services() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Featured services",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black38)),
      Container(
        height: 100.h,
        alignment: Alignment.center,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: features.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("${features[i]['image']}"),
                    radius: 30.r,
                  ),
                  Text(
                    "${features[i]['title']}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.spMin,
                        color: ColorsManger.darkblue),
                  )
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget appointment() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Your appointment",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsManger.lightblack)),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManger.darkblue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(width:100,
                    decoration: BoxDecoration(
                      color:Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        bottomRight:Radius.circular(0),
                        topRight:Radius.circular(100),
                      )

                  ),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 12, 0, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "You don't have any car wash appointment yet..",
                          style: TextStyle(
                              fontSize: 18.spMin,
                              fontWeight: FontWeight.bold,
                              color: ColorsManger.white),
                        ),
                        CustomButton("Book now",()=>Text("data"))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("images/car wash 3.jpg"),
                      fit: BoxFit.cover)),
              child: SizedBox(),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget Promotions() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Promotions",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsManger.lightblack)),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManger.darkblue,
          borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage("images/offers2.jpg"),
                fit: BoxFit.cover,
              ),
              // borderRadius: BorderRadius.circular(15),
          // image: DecorationImage(image: AssetImage("images/img.png"),fit: BoxFit.cover)
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 12, 0, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("For our most loyal customers!",
                        style: TextStyle(
                            fontSize: 20.spMin,
                            fontWeight: FontWeight.bold,
                            color: ColorsManger.white)),
                    CustomButton("Join now",()=>AboutUsView())
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("images/offers.jpg"),
                      fit: BoxFit.cover)),
              child: SizedBox(),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget About_us() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("About us",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsManger.lightblack)),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManger.darkblue,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage("images/img_1.png"),fit: BoxFit.cover)
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 12, 0, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton("Get to Know Us",()=>AboutUsView())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
