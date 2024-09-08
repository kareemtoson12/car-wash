import 'package:clean_wash/features/registration/car_type/car_type_controller.dart';
import 'package:clean_wash/features/registration/signin/signin_controller.dart';
import 'package:clean_wash/features/registration/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/colors_manger.dart';
import '../../../core/styels_manger.dart';

class CarTypeView extends StatelessWidget {
  CarTypeView({super.key});

  final CarTypeController carTypeController = Get.put(CarTypeController());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: ColorsManger.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.20,
              color: ColorsManger.darkblue,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.001,
                    right: screenWidth * 0.35,
                    top: screenHeight * 0.1,
                    bottom: screenHeight * 0.05,
                  ),
                  child:
                      Text('Before we start!', style: StylesManager.headline3),
                ),
              ),
            ),
            Container(
              width: screenWidth,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select your car type so we can adjust our prices for you!',
                      style: StylesManager.bodyText1,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            carTypeController.changeCarType('Coupe');
                          },
                          child: buildServiceOption(
                            carImage: 'images/coupe.png',
                            carName: 'Coupe',
                            value: 'Coupe',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            carTypeController.changeCarType('Sedan');
                          },
                          child: buildServiceOption(
                            carImage: 'images/sedan.png',
                            carName: 'Sedan',
                            value: 'Sedan',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            carTypeController.changeCarType('Micro');
                          },
                          child: buildServiceOption(
                            carImage: 'images/micro.png',
                            carName: 'Micro',
                            value: 'Micro',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            carTypeController.changeCarType('Hatchack');
                          },
                          child: buildServiceOption(
                            carImage: 'images/hatchback.png',
                            carName: 'Hatchack',
                            value: 'Hatchack',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            carTypeController.changeCarType('Sport');
                          },
                          child: buildServiceOption(
                            carImage: 'images/sport.png',
                            carName: 'Sport',
                            value: 'Sport',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            carTypeController.changeCarType('Van');
                          },
                          child: buildServiceOption(
                            carImage: 'images/van.png',
                            carName: 'Van',
                            value: 'Van',
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomButtom(
                          text: 'Submit',
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          onTap: () async {
                            carTypeController.saveCarType();
                          },
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

  Widget buildServiceOption({
    required String carImage,
    required String carName,
    required String value,
  }) {
    return Obx(
      () {
        final isSelected = carTypeController.selectedCarType.value == value;
        return Container(
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            border: Border.all(
                width: isSelected ? 2.w : 1.w, color: ColorsManger.darkblue),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Image.asset(
                carImage,
                height: 50.h,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  carName,
                  style: TextStyle(
                      color: ColorsManger.darkblue,
                      fontSize: 20.spMin,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 10.w),
              Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isSelected ? ColorsManger.darkblue : Colors.grey,
                size: 24.r,
              ),
            ],
          ),
        );
      },
    );
  }
}
