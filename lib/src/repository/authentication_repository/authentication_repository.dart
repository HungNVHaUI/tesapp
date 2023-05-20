import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/src/features/authentication/core/screens/dashboard.dart';
import 'package:testapp/src/features/screens/welcome/welcome_screen.dart';

import 'exception/signup_email_and_password_failure.dart';
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;


  @override
  void onReady(){
    Future.delayed(const Duration(seconds: 4));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => WelcomeScreen()) : Get.offAll(() => const DashBoard());
  }

  Future<void> createUserWithEmailAndPassword( String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const DashBoard()) : Get.offAll(() => WelcomeScreen());
    } on FirebaseAuthException catch(e){
      final ex = SignupEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION -${ex.message}');
      throw ex;
    } catch (_){
      final ex = SignupEmailAndPasswordFailure();
      print('EXCEPTION -${ex.message}');
       throw ex;
    };
  }


  Future<void> loginUserWithEmailAndPassword( String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
    } catch (_){}
  }

  Future<void> logout() async => await _auth.signOut();

}

