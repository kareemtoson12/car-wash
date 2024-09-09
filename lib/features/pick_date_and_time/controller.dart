import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  var selectedService = ''.obs;
  var selectedprice = ''.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
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


  // Function for saving selected date and time to Firestore for the logged-in user
  Future<void> saveDateTimeToFirestore() async {
    try {
      // Get the current logged-in user from Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Create a reference to the user's document in the 'Users' collection
        DocumentReference userRef = firestore.collection('Users').doc(user.email);

        // Update the selectedDay and selectedTime fields in the user's document
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
