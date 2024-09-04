import 'package:clean_wash/core/widgets/NextButton.dart';
import 'package:clean_wash/core/widgets/screen_title_widget.dart';
import 'package:clean_wash/core/widgets/selection_widget.dart';
import 'package:clean_wash/features/map_screen/maps.dart';

import 'package:clean_wash/features/pick_date_and_time/controller.dart';
import 'package:clean_wash/features/pick_date_and_time/widgets/time_selection_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class PickDateAndTime extends StatelessWidget {
  PickDateAndTime({super.key});

  //final StepperController stepperController = Get.put(StepperController());
  final CalendarController calendarController = Get.put(CalendarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScreenTitleWidget('pick date and time'),
                const Divider(),
                //Expanded(child: StepperView()),
                SelectionWidget('Select your date and time',
                    'select days when wash is available'),
                Obx(() => TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: calendarController.focusedDay.value,
                      selectedDayPredicate: (day) {
                        return isSameDay(
                            calendarController.selectedDay.value, day);
                      },
                      calendarFormat: calendarController.calendarFormat.value,
                      onDaySelected: (selectedDay, focusedDay) {
                        calendarController.onDaySelected(
                            selectedDay, focusedDay);
                      },
                      onFormatChanged: (format) {
                        calendarController.onFormatChanged(format);
                      },
                      onPageChanged: (focusedDay) {
                        calendarController.onPageChanged(focusedDay);
                      },
                      calendarStyle: const CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: true,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TimeSelectionWidget(),
                NextButton(MapWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
