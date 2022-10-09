// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  AppColors();

  //Neutrals
  static Color colorNeutral_900 = Color(0xFF1B1E25);
  static Color colorNeutral_800 = Color(0xFF4C4E58);
  static Color colorNeutral_600 = Color(0xFF737682);
  static Color colorNeutral_400 = Color(0xFFB5B9C6);
  static Color colorNeutral_200 = Color(0xFFD6D9E2);
  static Color colorNeutral_100 = Color(0xFFE6E8EF);
  static Color colorNeutral_50 = Color(0xFFF3F4F9);
  static Color colorNeutral_0 = Color(0xFFFBFCFF);

//Brand Blues
  static Color colorBlueSecondary_800 = Color(0xFF034F83);
  static Color colorBluePrimary_700 = Color(0xFF2464AF);
  static Color colorBlue_500 = Color(0xFF3E90F1);
  static Color colorBlue_50 = Color(0xFFE7F1FD);
  static Color colorBlue_0 = Color(0xFF4285F4);

//Brand Greens
  static Color colorGreenSecondary_600 = Color(0xFF018B88);
  static Color colorGreenPrimary_500 = Color(0xFF00B2AC);
  static Color colorGreen_400 = Color(0xFF01C7C1);
  static Color colorGreen_50 = Color(0xFFF0FCFB);
  static Color colorGreen_0 = Color(0xFF29D3BF);

//Brand Oranges
  static Color colorOrangeSecondary_600 = Color(0xFFE48F24);
  static Color colorOrangePrimary_400 = Color(0xFFF6BC16);
  static Color colorOrange_300 = Color(0xFFFFD600);
  static Color colorOrange_50 = Color(0xFFFEF7E2);

//FeedBack Colors
  static Color colorRedError_300 = Color(0xFFD9163A);
  static Color colorRedErrorBackground_50 = Color(0xFFFCE0E5);
  static Color colorGreenSuccess_300 = Color(0xFF31AF8B);
  static Color colorGreenSuccessBackground_50 = Color(0xFFE3F7F1);
  static Color colorOrangeAlert_300 = Color(0xFFFFD600);
  static Color colorOrangeAlertBackground_50 = Color(0xFFFEF7E2);
  static Color colorBlueInfo_500 = Color(0xFF3E90F1);
  static Color colorBlueInfoBackground_50 = Color(0xFFE7F1FD);

  static Gradient greenGradient = LinearGradient(
    colors: [AppColors.colorGreenPrimary_500, AppColors.colorGreen_0],
  );

  static Gradient blueGradient = LinearGradient(
    colors: [AppColors.colorBluePrimary_700, AppColors.colorBlue_0],
  );

  static Color cardNotificationBackground = Color(0xFFFBFCFF);
  static Color dashboardBackground = Color(0xFFE5E5E5);
}
