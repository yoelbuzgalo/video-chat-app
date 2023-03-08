import 'package:flutter/material.dart';
import 'package:video_call_test/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({required label, color, required onPressed})
      : this._label = label,
        this._onPressed = onPressed,
        this._color = color;

  final String _label;
  final Color? _color;
  final void Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _color ?? AppColor.navyBlue,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: TextButton(
        child: Text(
          _label,
          style: AppTextStyle.bigWhiteFont,
        ),
        onPressed: _onPressed,
      ),
    );
  }
}
