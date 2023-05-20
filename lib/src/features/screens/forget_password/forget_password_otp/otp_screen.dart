import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/src/common_widgets/form/form_header_widget.dart';
import 'package:testapp/src/constants/image_strings.dart';
import 'package:testapp/src/constants/sizes.dart';
import 'package:testapp/src/constants/text_strings.dart';
import 'package:testapp/src/features/authentication/screens/login/widgets/login_form_widget.dart';

import '../../../authentication/screens/login/widgets/login_footer_widget.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen ({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tOtpTitle, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 80.0),textAlign: TextAlign.center),
                Text(tOtpSubTitle, style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 40.0,),
                 Text("$tMessage xxx@gmail.com", textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline6,),
                const SizedBox(height: 20.0,),

                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code){print("OTP is => $code");},
                ),
                const SizedBox(height: 20.0,),
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child: const Text(tNext)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}