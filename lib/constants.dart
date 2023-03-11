import 'package:flutter/material.dart';

class AppColor {
  static Color white = const Color(0xFFFFFFFF);
  static Color navyBlue = const Color(0xFF3755A5);
  static Color darkerNavyBlue = const Color(0xFF263866);
  static Color errorRed = const Color(0xFFED4337);
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
  static TextStyle normalWhiteFont = new TextStyle(
    fontSize: 16,
    fontFamily: 'Ubuntu',
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );
}
