import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class CalendarController extends GetxController {
  var ischocien = false.obs;
  var chocienColor = Colors.orange.obs;

  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var calendarFormat = CalendarFormat.month.obs;
  var selectedTime = ''.obs;

  // Function for selecting a day on the calendar
  void onDaySelected(DateTime newSelectedDay, DateTime newFocusedDay) {
    selectedDay.value = newSelectedDay;
    focusedDay.value = newFocusedDay;
  }

  // Function for changing the calendar format (month, week, etc.)
  void onFormatChanged(CalendarFormat format) {
    if (calendarFormat.value != format) {
      calendarFormat.value = format;
    }
  }

  // Function for handling page change in the calendar
  void onPageChanged(DateTime newFocusedDay) {
    focusedDay.value = newFocusedDay;
  }

  // Function for selecting a time slot
  void selectTime(String time) {
    selectedTime.value = time;
  }

  // Function to send selected time and date to Firebase
  Future<void> setTimeAndDate(String userName) async {
    print("Sending time and date to Firebase for user: $userName"); // Debugging
    print("Selected time: ${selectedTime.value}");
    print("Selected date: ${selectedDay.value}");

    try {
      await FirebaseFirestore.instance.collection('Users').doc(userName).set(
          {
            'selectedTime': selectedTime.value,
            'selectedDate': selectedDay.value.toIso8601String(),
          },
          SetOptions(
              merge:
                  true)); // SetOptions to merge with existing fields if necessary

      // Show success snackbar
      Get.snackbar('Success', 'Time and date updated successfully.');
    } catch (error) {
      // Show error snackbar
      // Get.snackbar('Error', 'Failed to update time and date.');
      print('Error sending time and date to Firebase: $error'); // Debugging
    }
  }
}
