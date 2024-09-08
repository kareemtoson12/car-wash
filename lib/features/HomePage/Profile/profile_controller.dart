import 'package:clean_wash/features/registration/create_account/create_account_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class profileController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    get_data();
  }
  static FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String userName='';
  String userEmail='';
  String userCar='';
  Future get_data()async{
    var data= await _firestore.collection('Users').doc(_auth.currentUser!.email).get();
    if (data.exists) {
      userEmail = data.data()?['email'] ?? 'No email'; // Safely retrieve email
      userName = data.data()?['fullName'] ?? 'No name'; // Safely retrieve email
      update(); // Notify GetX to rebuild the UI
    }
   return data;
  }


}