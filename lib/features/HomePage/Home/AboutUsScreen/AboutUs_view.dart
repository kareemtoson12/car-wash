import 'package:flutter/material.dart';
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
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: ColorsManger.darkblue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'About us',
          style: StylesManager.titleText,
        ),
        actions: [NotificationButton()],
      ),
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: controller.pages.length,
        onPageChanged: controller.onPageChanged,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(controller.pages[index]['image']!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  controller.pages[index]['title']!,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: ColorsManger.darkblue,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  controller.pages[index]['description']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                // Wrap only the indicators with Obx
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.pages.length,
                      (dotIndex) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
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
    );
  }
}
