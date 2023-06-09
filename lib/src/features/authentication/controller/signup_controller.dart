import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();


  final email =  TextEditingController();
  final password =  TextEditingController();
  final fullName =  TextEditingController();
  final phoneNo =  TextEditingController();


  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}