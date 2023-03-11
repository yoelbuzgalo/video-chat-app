import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_call_test/constants.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField(
      {required Function(String) onChangeCallback,
      required TextInputType keyBoardType,
      String? labelText,
      bool? obscureText,
      bool? isDigitOnly,
      IconData? icon,
      int? maxLength,
      Key? key})
      : _onChangeCallback = onChangeCallback,
        _keyBoardType = keyBoardType,
        _obscureText = obscureText,
        _labelText = labelText,
        _maxLength = maxLength,
        _isDigitOnly = isDigitOnly,
        _icon = icon,
        super(key: key);

  final Function(String) _onChangeCallback;
  final IconData? _icon;
  final String? _labelText;
  final TextInputType _keyBoardType;
  final bool? _obscureText;
  final int? _maxLength;
  final bool? _isDigitOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.darkerNavyBlue.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(_maxLength),
          if (_isDigitOnly == true) FilteringTextInputFormatter.digitsOnly,
        ],
        enableSuggestions: false,
        cursorColor: AppColor.white,
        obscureText: _obscureText ?? false,
        onChanged: _onChangeCallback,
        keyboardType: _keyBoardType,
        decoration: InputDecoration(
          labelStyle: AppTextStyle.normalWhiteFont,
          labelText: _labelText,
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(
              _icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
