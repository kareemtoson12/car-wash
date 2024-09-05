import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/widgets/NotificationButton.dart';
import '../../../../core/styels_manger.dart';
import 'AboutUs_controller.dart';

class AboutUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AboutUsController controller = Get.put(AboutUsController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25.sp,
            color: ColorsManger.darkblue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'About us',
          style: StylesManager.titleText.copyWith(fontSize: 24.sp),
        ),
        actions: [NotificationButton()],
      ),
      body: Center(
        child: PageView.builder(
          controller: controller.pageController,
          itemCount: controller.pages.length,
          onPageChanged: controller.onPageChanged,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        image: DecorationImage(
                          image: AssetImage(controller.pages[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    controller.pages[index]['title']!,
                    style: TextStyle(
                      fontSize: 30.spMin,
                      fontWeight: FontWeight.bold,
                      color: ColorsManger.darkblue,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    controller.pages[index]['description']!,
                    style: TextStyle(
                      fontSize: 16.spMin,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Wrap only the indicators with Obx
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.pages.length,
                        (dotIndex) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: dotIndex == controller.currentPage.value
                                ? ColorsManger.orange
                                : Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
