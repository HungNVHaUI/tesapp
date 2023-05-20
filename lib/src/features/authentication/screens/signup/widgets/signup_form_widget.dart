import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testapp/src/constants/colors.dart';
import 'package:testapp/src/constants/image_strings.dart';
import 'package:testapp/src/constants/sizes.dart';
import 'package:testapp/src/constants/text_strings.dart';

import '../../../controller/signup_controller.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  _SignUpFormWidgetState createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(labelText: tFullName, prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height: tFormHeight - 20.0),
            TextFormField(
              controller: controller.email,
              decoration:const InputDecoration(labelText: tEmail, prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: tFormHeight - 20.0),
            TextFormField(
              controller: controller.phoneNo,
              decoration:const InputDecoration(labelText: tPhoneNo, prefixIcon: Icon(Icons.phone_android)),
            ),
            const SizedBox(height: tFormHeight - 20.0),
            TextFormField(
              controller: controller.password,
              obscureText: _obscureText,
              decoration: InputDecoration(labelText: tPassword, prefixIcon: Icon(Icons.fingerprint),
                suffixIcon: GestureDetector(
                  onTap: _togglePasswordVisibility,
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 10.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if( _formKey.currentState!.validate()){
                    SignUpController.instance.registerUser(
                        controller.email.text.trim(),
                        controller.password.text.trim(),);                  }
                },
                child: Text(tSignUp.toUpperCase()),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
