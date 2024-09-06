import 'package:get/get.dart';

class EditProfileController extends GetxController{
  var Fullname;
  var Email;
  var Password;
  EditProfileController(){
    get_data();
  }
  Future get_data()async{
    Fullname='Doha ayman';
    Email='dohaayman@gmail.com';
    Password='123123';
  }


}