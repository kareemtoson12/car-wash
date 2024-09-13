import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/core/styels_manger.dart';
import 'package:clean_wash/core/widgets/stepper_widget.dart';

import 'package:clean_wash/features/Payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      backgroundColor: ColorsManger.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Payment',
          style: StylesManager.titleText,
        ),
      ),
      body: Column(
        children: [
          MyStteper(activeStep: 3),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.dg),
              child: GetBuilder<PaymentController>(
                builder: (_) => ListView.builder(
                  itemCount: paymentMethodsImages
                      .length, // Use a separate list for methods
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 30.0.dm),
                      child: AnimatedContainer(
                        height: 120.h,
                        width: double.infinity,
                        duration: const Duration(milliseconds: 100),
                        decoration: ShapeDecoration(
                          color: ColorsManger.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.5.w, color: ColorsManger.primaryColor),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: RadioListTile(
                          title: Row(
                            children: [
                              Image.asset(
                                paymentMethodsImages[index],
                                height: 100.h,
                                fit: BoxFit.scaleDown,
                                scale: 4,
                              ),
                              Text(
                                paymentMethodsTitles[index],
                                selectionColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          value: index,
                          groupValue: controller.selectedValue.value,
                          onChanged: controller.onRadioSelected,
                          activeColor: Colors.orange,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.makePayment(amount: '15', currency: 'USD');
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.all(10.dg),
                decoration: BoxDecoration(
                  color: ColorsManger.AccentOrange,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.dg),
                  child: Text('Make Payment', style: StylesManager.bodyText4),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Assuming payment methods are defined elsewhere (e.g., in a constants file)
const List<String> paymentMethodsTitles = [
  'Apple Pay',
  'GooglePay',
  'Credit Card',
  'Paypal'
];
const List<String> paymentMethodsImages = [
  'images/ApplePay.png',
  'images/GooglePay.png',
  'images/Credit.png',
  'images/Paypal.png'
];
