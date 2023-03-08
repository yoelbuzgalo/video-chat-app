import 'package:flutter/material.dart';

class AppColor {
  static Color white = Color(0xFFFFFFFFF);
  static Color navyBlue = Color(0xFF3755A5);
  static Color darkerNavyBlue = Color(0xFF263866);
}

class AppTextStyle {
  static TextStyle titleWhiteFont = new TextStyle(
    fontSize: 25,
    fontFamily: 'Ubuntu-Medium',
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
  static TextStyle bigWhiteFont = new TextStyle(
    fontSize: 20,
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
}
