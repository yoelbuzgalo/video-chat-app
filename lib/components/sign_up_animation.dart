import 'package:flutter/material.dart';
import 'package:video_call_test/models/sign_up_quotes.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignUpAnimationText extends StatefulWidget {
  SignUpAnimationText(
      {Function(int, bool)? onNextBeforePauseCallback,
      Function(int, bool)? onNextCallback})
      : this._onNextBeforePause = onNextBeforePauseCallback,
        this._onNext = onNextCallback;
  final void Function(int, bool)? _onNextBeforePause;
  final void Function(int, bool)? _onNext;

  @override
  State<SignUpAnimationText> createState() => _SignUpAnimationTextState();
}

class _SignUpAnimationTextState extends State<SignUpAnimationText> {
  final SignUpQuotes signUpQuotes = new SignUpQuotes();

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
        repeatForever: true,
        onNextBeforePause: widget._onNextBeforePause,
        onNext: widget._onNext,
        animatedTexts: signUpQuotes.getQuotes);
  }
}
