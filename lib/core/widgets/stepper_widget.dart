// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyStteper extends StatefulWidget {
  int activeStep;
  MyStteper({
    Key? key,
    required this.activeStep,
  }) : super(key: key);

  @override
  State<MyStteper> createState() => _MyStteperState();
}

class _MyStteperState extends State<MyStteper> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: widget.activeStep,
      activeStepTextColor: Colors.black87,
      finishedStepTextColor: Colors.black87,
      internalPadding: 40.dg,
      showLoadingAnimation: false,
      stepRadius: 8,
      showStepBorder: false,
      steps: [
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor:
                  widget.activeStep >= 0 ? Colors.orange : Colors.white,
            ),
          ),
          title: 'Date and Time',
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor:
                  widget.activeStep >= 1 ? Colors.orange : Colors.white,
            ),
          ),
          title: 'Location',
          topTitle: true,
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor:
                  widget.activeStep >= 2 ? Colors.orange : Colors.white,
            ),
          ),
          title: 'Payment',
        ),
      ],
      onStepReached: (index) {
        setState(() {
          widget.activeStep =
              index; // Update the activeStep when a step is reached
        });
      },
    );
    ;
  }
}
