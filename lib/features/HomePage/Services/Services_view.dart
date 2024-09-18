import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:clean_wash/core/widgets/NextButton.dart';
import 'package:clean_wash/core/widgets/NotificationButton.dart';
import 'package:clean_wash/features/HomePage/Services/Services_controller.dart';
import 'package:clean_wash/features/pick_date_and_time/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServicesView extends StatelessWidget {
  ServicesView({super.key});

  final ServicesController serviceController = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services', style: StylesManager.titleText),
        centerTitle: true,
        actions: [
          NotificationButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 5.h),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  serviceController.changeService('Standard wash', '15');
                },
                child: buildServiceOption(
                  iconwidget:
                      Icon(Icons.check_circle, color: Colors.blue, size: 18.r),
                  widget: Image.asset("images/bronze.png", height: 45.h),
                  title: 'Standard wash',
                  price: 15,
                  features: [
                    'Exterior wash',
                    'Tyre cleaning',
                    'Vacuuming',
                    'Hand drying'
                  ],
                  value: 'Standard wash',
                ),
              ),
              GestureDetector(
                onTap: () {
                  serviceController.changeService('Deluxe wash', '45');
                },
                child: buildServiceOption(
                  iconwidget: Image.asset("images/bronze.png", height: 20.h),
                  widget: Image.asset("images/silver.png", height: 45.h),
                  title: 'Deluxe wash',
                  price: 45,
                  features: [
                    'Standard wash',
                    'Tyre cleaning',
                    'Engine detailing',
                    'Hand waxing'
                  ],
                  value: 'Deluxe wash',
                ),
              ),
              GestureDetector(
                onTap: () {
                  serviceController.changeService('Premium wash', '95');
                },
                child: buildServiceOption(
                  iconwidget: Image.asset("images/silver.png", height: 20.h),
                  widget: Image.asset("images/gold.png", height: 45.h),
                  title: 'Premium wash',
                  price: 95,
                  features: [
                    'Deluxe wash',
                    'Full detailing',
                    'Deep cleaning',
                    'Headlight restoration'
                  ],
                  value: 'Premium wash',
                ),
              ),
              // SizedBox(height:5.h),
              NextButton(
                  'Book now',
                  PickDateAndTime(
                    Services: serviceController.selectedService.value,
                    Price: serviceController.ServicesPrice.value,
                  ),
                  () {},
                  300)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildServiceOption({
    required String title,
    required Widget widget,
    required Widget iconwidget,
    required int price,
    required List<String> features,
    required String value,
  }) {
    return Obx(() {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: serviceController.selectedService == value
                  ? ColorsManger.accentColor
                  : Colors.grey,
              width: 2),
        ),
        margin: EdgeInsets.only(top: 6.h),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      widget,
                      SizedBox(width: 8.w),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 24.spMin, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(features.length, (index) {
                      return Row(
                        children: [
                          index == 0
                              ? iconwidget
                              : Icon(Icons.check_circle,
                                  color: Colors.blue, size: 18.r),
                          SizedBox(width: 8.w),
                          Text(features[index],
                              style: TextStyle(fontSize: 16.spMin)),
                        ],
                      );
                    }),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Spacer(),
                  Text(
                    '$price\$',
                    style: TextStyle(
                        fontSize: 25.spMin,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  Radio<String>(
                    value: value,
                    groupValue: serviceController.selectedService.value,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        serviceController.changeService(newValue, price);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
