import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:clean_wash/features/onboarding/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: ColorsManger.black,
      body: SafeArea(
        child: Column(
          children: [
            // PageView for sliding between onboarding screens
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged:
                    controller.onPageChanged, // Call the controller method
                itemCount: controller.onboardingTexts.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image that stays the same
                        SizedBox(
                          width: 300.w,
                          height: 300.h,
                          child: Image.asset(
                            'images/car-wash.png',
                          ),
                        ),
                        SizedBox(height: 20.h),
                        // Onboarding text that changes with each page
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Container(
                            width: 400.w,
                            height: 200.h,
                            decoration: BoxDecoration(
                                color: ColorsManger.purpule,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(controller.onboardingTexts[index],
                                  style: StylesManager.bodyText1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(controller.onboardingTexts.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    width: controller.currentPage.value == index ? 12.w : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? ColorsManger.purpule
                          : ColorsManger.grey,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  );
                }),
              );
            }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
