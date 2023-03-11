import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:video_call_test/constants.dart';

class SignUpAnimationText extends StatefulWidget {
  List<AnimatedText> get _getSignUpQuotes {
    final List<String> _signUpQuotes = [
      'Join our community and experience a video chat app designed specifically for the deaf, with unique features and accessibility options.',
      'Communication without barriers. Sign up now for our deaf-friendly video chat app.',
      'Connect with fellow deaf individuals in a seamless and inclusive way, with our video chat app made for you.',
    ];
    List<AnimatedText> animatedQuoteTexts = [];
    for (final String quote in _signUpQuotes) {
      animatedQuoteTexts.add(
        ColorizeAnimatedText(
          quote,
          speed: Duration(milliseconds: 80),
          textStyle: AppTextStyle.bigWhiteFont,
          textAlign: TextAlign.center,
          colors: [AppColor.white, AppColor.navyBlue, AppColor.darkerNavyBlue],
        ),
      );
    }
    return animatedQuoteTexts;
  }

  @override
  State<SignUpAnimationText> createState() => _SignUpAnimationTextState();
}

class _SignUpAnimationTextState extends State<SignUpAnimationText> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
        repeatForever: true, animatedTexts: widget._getSignUpQuotes);
  }
}
