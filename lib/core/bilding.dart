import 'package:get/get.dart';
import '../features/Payment/payment_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(()=>PaymentController());
  }
}