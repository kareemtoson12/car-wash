import 'package:clean_wash/features/Payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GetBuilder<PaymentController>(
                builder: (_) => ListView.builder(
                  itemCount: paymentMethodsImages.length, // Use a separate list for methods
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: AnimatedContainer(
                        height: 120,
                        width: double.infinity,
                        duration: const Duration(milliseconds: 100),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1.5,
                              color: Colors.white
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: RadioListTile(
                          title: Row(
                            children: [
                              Image.asset(paymentMethodsImages[index],
                                height: 100,
                                fit:BoxFit.scaleDown,
                              scale: 4,),
                              Text(paymentMethodsTitles[index],
                                selectionColor: Colors.white,style: const TextStyle(
                                  color: Colors.white
                                ),),
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
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
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
                  child: Text(
                    'Make Payment',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
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
const List<String> paymentMethodsTitles = ['Apple Pay', 'GooglePay', 'Credit Card', 'Paypal'];
const List<String> paymentMethodsImages =
['images/ApplePay.png',
  'images/GooglePay.png',
  'images/Credit.png',
  'images/Paypal.png'];