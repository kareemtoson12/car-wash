import 'package:get/get.dart';

class ServicesController extends GetxController{
  var selectedService = ''.obs;

  changeService(value){
    selectedService.value=value;
  }

}