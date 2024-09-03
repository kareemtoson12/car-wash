import 'package:clean_wash/core/styels_manger.dart';
import 'package:clean_wash/features/pick_date_and_time/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Ensure you initialize your controller in main or the top level
final CalendarController calendarController = Get.put(CalendarController());

class TimeSelectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Time',
            style: StylesManager.bodyText1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              timeWidget('11:30 AM'),
              timeWidget('12:30 PM'),
              timeWidget('2:00 PM'),
            ],
          )
        ],
      ),
    );
  }

  Widget timeWidget(String time) {
    return Obx(() => Container(
          margin: EdgeInsets.symmetric(horizontal: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: calendarController.selectedTime.value == time
                ? calendarController.chocienColor.value
                : Colors.grey,
          ),
          child: GestureDetector(
            onTap: () {
              calendarController.selectTime(time);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 4.w),
              child: Text(
                time,
                style: StylesManager.bodyText3,
              ),
            ),
          ),
        ));
  }
}
