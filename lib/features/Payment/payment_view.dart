import 'package:clean_wash/core/widgets/NextButton.dart';
import 'package:clean_wash/features/HomePage/Home/home_view.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  @override
  State<PaymentView> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<PaymentView> {
  final List<String> title = ['Apple Pay', 'Payment', 'Credit Card', 'Cash'];
  final List<String> image = ['Apple Pay', 'Payment', 'Credit Card', 'Cash'];


  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 60,
                child: ListView.builder(

                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: AnimatedContainer(
                        width: double.infinity,
                        duration: const Duration(milliseconds: 300),
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1.5,),
                              borderRadius: BorderRadius.circular(16),
                            ),

                        ),
                        child: RadioListTile(
                          title: Text(title[index]),
                          value: index,
                          groupValue: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                          activeColor: Colors.orange ,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          NextButton('Next', HomeView()),
        ],
      ),
    );
  }
}