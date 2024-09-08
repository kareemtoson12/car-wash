import 'package:get/get.dart';

class CarTypeController extends GetxController {
  var selectedCarType = ''.obs; 

  void changeCarType(String value) {
    selectedCarType.value = value; 
  }
}
