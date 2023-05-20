import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/src/constants/colors.dart';
import 'package:testapp/src/constants/sizes.dart';
import 'package:testapp/src/constants/text_strings.dart';
import 'package:testapp/src/features/authentication/core/screens/dashboard.dart';
import 'package:testapp/src/repository/authentication_repository/authentication_repository.dart';

import '../../../screens/home/dash_board_app_bar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        appBar: DashBoardAppBar(isDark: isDark),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(tDashboardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tDashboardTitle, style: txtTheme.bodyText2,),

                ],
              )
          ),
        ),
      ),
    );
  }
}
