import 'package:clean_wash/core/colors_manger.dart';
import 'package:clean_wash/features/Payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      backgroundColor: ColorsManger.darkblue,
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Define breakpoints for different screen sizes
          final isSmallScreen = constraints.maxWidth < 600;

          return Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 8.0 : 16.0,
                  ),
                  child: GetBuilder<PaymentController>(
                    builder: (_) => ListView.builder(
                      itemCount: paymentMethodsImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: AnimatedContainer(
                            height: isSmallScreen ? 80.0 : 120.0,
                            width: double.infinity,
                            duration: const Duration(milliseconds: 100),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: RadioListTile(
                              title: Row(
                                children: [
                                  Image.asset(
                                    paymentMethodsImages[index],
                                    height: isSmallScreen ? 50.0 : 100.0,
                                    fit: BoxFit.scaleDown,
                                    scale: isSmallScreen ? 3 : 4,
                                  ),
                                  SizedBox(width: isSmallScreen ? 8.0 : 16.0), // Add spacing based on screen size
                                  Text(
                                    paymentMethodsTitles[index],
                                    selectionColor: ColorsManger.white,
                                    style:TextStyle(color: ColorsManger.white),
                                  ),
                                ],
                              ),
                              value: index,
                              groupValue: controller.selectedValue.value,
                              onChanged: controller.onRadioSelected,
                              activeColor: ColorsManger.white,
                              selectedTileColor:ColorsManger.darkblue ,
                              hoverColor: ColorsManger.black,),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: InkWell(
                  onTap: () {
                    controller.makePayment(amount: '15', currency: 'USD');
                  },
                  child: Center(
                    child: Container(
                      width: isSmallScreen ? constraints.maxWidth * 0.8 : double.infinity, // Adjust container width based on screen size
                      decoration: BoxDecoration(
                        color: ColorsManger.accentColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Make Payment',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
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
