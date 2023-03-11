import 'package:flutter/material.dart';
import 'package:video_call_test/constants.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required bool visible,
    required String errorMessage,
  })  : _visible = visible,
        _errorMessage = errorMessage;

  final bool _visible;
  final String _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColor.errorRed.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            _errorMessage,
            style: AppTextStyle.normalWhiteFont,
          ),
        ),
      ),
    );
  }
}
