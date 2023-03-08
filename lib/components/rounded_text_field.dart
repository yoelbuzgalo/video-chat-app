import 'package:flutter/material.dart';
import 'package:video_call_test/constants.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField(
      {required Function(String) onChangeCallback,
      required TextInputType keyBoardType,
      bool? obscureText,
      IconData? icon})
      : _onChangecallback = onChangeCallback,
        _keyBoardType = keyBoardType,
        _obscureText = obscureText,
        _icon = icon;

  final Function(String) _onChangecallback;
  final IconData? _icon;
  final TextInputType _keyBoardType;
  final bool? _obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.darkerNavyBlue.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        obscureText: _obscureText ?? false,
        onChanged: _onChangecallback,
        keyboardType: _keyBoardType,
        decoration: InputDecoration(
          icon: Icon(
            _icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
