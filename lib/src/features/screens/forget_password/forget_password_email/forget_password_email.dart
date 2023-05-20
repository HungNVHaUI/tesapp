import 'package:flutter/material.dart';
import 'package:testapp/src/common_widgets/form/form_header_widget.dart';
import 'package:testapp/src/constants/image_strings.dart';
import 'package:testapp/src/constants/sizes.dart';
import 'package:testapp/src/constants/text_strings.dart';
import 'package:testapp/src/features/authentication/screens/login/widgets/login_form_widget.dart';
import 'package:get/get.dart';

import '../../../authentication/screens/login/widgets/login_footer_widget.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
   const ForgetPasswordEmailScreen ({Key? key}) : super(key: key);


   @override
    Widget build(BuildContext context){
     return SafeArea(
       child: Scaffold(
           body: SingleChildScrollView(
             child: Container(
               padding: const EdgeInsets.all(tDefaultSize),

               child: Column (
                children:  [
                  const SizedBox(height: tDefaultSize * 4),
                 const  FormHeaderWidget(
                    image: tForgetPasswordImage,
                    title: tForgetPassword,
                    subTitle: tForgetPasswordSubTitle,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    heightBetween: 30.0,
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: tFormHeight),
                  Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text(tEmail),
                              hintText: tEmail,
                              prefixIcon: Icon(Icons.mail_outline_rounded),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          SizedBox(
                              width: double.infinity ,
                              child: ElevatedButton(
                                  onPressed: (){Get.to(() => const OTPScreen()) ;},
                                  child: const  Text(tNext),
                              )
                          ),
                        ],))

                 ],
               ),
             ),
           ),
       ),
     );
  }
}