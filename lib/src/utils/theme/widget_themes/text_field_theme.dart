import 'package:flutter/material.dart';
import 'package:testapp/src/constants/colors.dart';



class TTextFormFieldTheme {
  TTextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: tSecondaryColor,
        floatingLabelStyle: TextStyle(color: tSecondaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: tSecondaryColor),
        )
      );



  static InputDecorationTheme darkInputDecorationTheme =
  const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: tWhiteColor,
      floatingLabelStyle: TextStyle(color: tWhiteColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: tWhiteColor),
      )
  );
}

