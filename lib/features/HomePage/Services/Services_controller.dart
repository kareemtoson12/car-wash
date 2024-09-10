import 'package:get/get.dart';

class ServicesController extends GetxController{
  var selectedService = ''.obs;
  var ServicesPrice = ''.obs;

  changeService(value,price){
    selectedService.value=value;
    ServicesPrice.value=price.toString();
  }

}