import 'package:flutter/material.dart';
import 'package:video_call_test/constants.dart';
import 'package:video_call_test/components/rounded_button.dart';
import 'package:video_call_test/screens/registration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'WelcomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Text(
                    'Smart Tech\nDeaf Video Calling Service',
                    style: AppTextStyle.titleWhiteFont,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Hero(
                    tag: 'logo',
                    child: Image(
                      height: 100,
                      image: const AssetImage('images/logo.png'),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RoundedButton(
                    label: 'Login',
                    onPressed: () => print('Logged in!'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: 'Register-Button',
                    child: RoundedButton(
                      label: 'Register',
                      color: AppColor.darkerNavyBlue,
                      onPressed: () =>
                          Navigator.pushNamed(context, RegistrationScreen.id),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
