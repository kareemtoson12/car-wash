import 'dart:convert';
import 'package:clean_wash/features/Payment/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../core/api_key.dart';
import '../HomePage/NaiveBar/Naivebar_view.dart';

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;
  final RxInt selectedValue = 0.obs;
  var paymentType = "".obs;
  final activeStep = 2.obs;

  void onRadioSelected(value) {
    selectedValue.value = value;

    update();
  }

  void onNextButtonPressed() {
    Get.snackbar(
      "Selected Payment",
      "You chose ${paymentMethodsImages[selectedValue.value]}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 4),
    );
  }

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        customFlow: false,
        googlePay: const PaymentSheetGooglePay(
          merchantCountryCode: 'US',
          testEnv: true,
        ),
        merchantDisplayName: 'Prospects',
        customerId: paymentIntentData!['customer'],
        paymentIntentClientSecret: paymentIntentData!['client_secret'],
        customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
      ));
      displayPaymentSheet();
      Get.to(() => NaivebarView());

    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar('Payment', 'Payment Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2));
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ${ApiKeys.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('payment Intel Body ->> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
