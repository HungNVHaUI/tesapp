import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/src/constants/sizes.dart';
import 'package:testapp/src/constants/text_strings.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import '../../../../screens/forget_password/forget_password_options/forget_password_model_buttom_sheet.dart';
import '../../signup/signup_screen.dart';
import '../login_screen.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: tEmail,
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20.0),
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: tPassword,
                prefixIcon: Icon(Icons.fingerprint),
                suffixIcon: GestureDetector(
                  onTap: _togglePasswordVisibility,
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(tLogIn.toUpperCase()),
              ),

            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(tForgetPassword),
              ),
            ),
            Column(
              children: [
                const Text('OR'),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage(tGoogleLogoImage),
                      width: 20.0,
                    ),
                    label: const Text('Log In With Google'),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.to(SignUpScreen());
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: tDontHaveAnAccount,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    TextSpan(text: tSignUp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
