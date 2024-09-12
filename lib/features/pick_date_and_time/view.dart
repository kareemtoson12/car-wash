import 'package:clean_wash/core/widgets/NextButton.dart';
import 'package:clean_wash/core/widgets/screen_title_widget.dart';
import 'package:clean_wash/core/widgets/stepper_widget.dart';
import 'package:clean_wash/features/map_screen/maps.dart';
import 'package:clean_wash/features/pick_date_and_time/controller.dart';
import 'package:clean_wash/features/pick_date_and_time/widgets/time_selection_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class PickDateAndTime extends StatefulWidget {
  var Services;
  var Price;
  PickDateAndTime({required this.Services, required this.Price, super.key});

  @override
  State<PickDateAndTime> createState() => _PickDateAndTimeState();
}

class _PickDateAndTimeState extends State<PickDateAndTime> {
  final CalendarController calendarController = Get.put(CalendarController());
  int activeStep = 0; // Active step index for the stepper

  @override
  void initState() {
    super.initState();
    calendarController.selectedprice.value = widget.Services;
    calendarController.selectedprice.value = widget.Price;
  }

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
                ScreenTitleWidget('Pick Date and Time'),
                const Divider(),
                // Insert the Stepper widget here
                MyStteper(
                  activeStep: activeStep,
                ),
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
                          color: Colors.orange,
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
                NextButton(
                  'Next',
                  MapWidget(
                    activeSteep: 1,
                  ),
                  () => calendarController.saveDateTimeToFirestore(),
                  350,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
