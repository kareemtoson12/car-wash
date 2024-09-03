import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'stepper_controller.dart';

class StepperView extends StatelessWidget {
  const StepperView({super.key});

  @override
  Widget build(BuildContext context) {
    final StepperController controller = Get.find<StepperController>();

    return Padding(
      padding: EdgeInsets.all(8.0.h),
      child: Obx(() => Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            currentStep: controller.currentStep.value,
            onStepTapped: (step) {
              controller.goToStep(step);
            },
            onStepContinue: controller.nextStep,
            onStepCancel: controller.previousStep,
            steps: [
              Step(
                title: const Text(''),
                content: Container(),
                isActive: controller.currentStep.value >= 0,
                state: controller.currentStep.value > 0
                    ? StepState.complete
                    : StepState.indexed,
              ),
              Step(
                title: const Text(''),
                content: Container(),
                isActive: controller.currentStep.value >= 1,
                state: controller.currentStep.value > 1
                    ? StepState.complete
                    : StepState.indexed,
              ),
              Step(
                title: const Text(''),
                content: Container(),
                isActive: controller.currentStep.value >= 2,
                state: controller.currentStep.value > 2
                    ? StepState.complete
                    : StepState.indexed,
              ),
              Step(
                title: const Text(''),
                content: Container(),
                isActive: controller.currentStep.value >= 3,
                state: controller.currentStep.value == 3
                    ? StepState.complete
                    : StepState.indexed,
              ),
            ],
            connectorColor: WidgetStateProperty.all(Colors.orange),
            controlsBuilder: (context, controller) {
              return const SizedBox.shrink();
            },
          )),
    );
  }
}
