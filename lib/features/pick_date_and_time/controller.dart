import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class CalendarController extends GetxController {
  var ischocien = false.obs;
  var chocienColor = Colors.orange.obs;
  final activeStep = 0.obs;
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var calendarFormat = CalendarFormat.month.obs;
  var selectedTime = ''.obs;
  var selectedService = ''.obs;
  var selectedprice = ''.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void onDaySelected(DateTime newSelectedDay, DateTime newFocusedDay) {
    selectedDay.value = newSelectedDay;
    focusedDay.value = newFocusedDay;
  }

  void onFormatChanged(CalendarFormat format) {
    if (calendarFormat.value != format) {
      calendarFormat.value = format;
    }
  }

  void onPageChanged(DateTime newFocusedDay) {
    focusedDay.value = newFocusedDay;
  }

  void selectTime(String time) {
    selectedTime.value = time;
  }

  Future<void> saveDateTimeToFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentReference userRef =
            firestore.collection('Users').doc(user.email);

        await userRef.set({
          'selectedDay': selectedDay.value.toIso8601String(),
          'selectedTime': selectedTime.value,
          'selectedService': selectedService.value,
          'selectedPrice': selectedprice.value,
        }, SetOptions(merge: true));

        Get.snackbar('Success', 'Date and Time saved successfully');
      } else {
        Get.snackbar('Error', 'No user is currently logged in.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to save Date and Time: $e');
    }
  }
}
