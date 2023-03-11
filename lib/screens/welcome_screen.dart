import 'package:flutter/material.dart';
import 'package:video_call_test/constants.dart';
import 'package:video_call_test/components/rounded_button.dart';
import 'package:video_call_test/screens/login_screen.dart';
import 'package:video_call_test/screens/registration_screen.dart';
import 'package:video_call_test/components/background_image.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentBackgroundIndex = 1;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        upperBound: 1.0,
        lowerBound: 0.0,
        duration: const Duration(seconds: 3),
        value: 0.0);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    playBackgroundAnimation();
    super.initState();
  }

  void playBackgroundAnimation() async {
    while (true) {
      await _controller.forward();
      await Future.delayed(const Duration(seconds: 2));
      await _controller.reverse();
      if (_animation.isDismissed) {
        _currentBackgroundIndex < 3
            ? setState(() => _currentBackgroundIndex++)
            : setState(() => _currentBackgroundIndex = 1);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          FadeTransition(
            key: const ValueKey(1),
            opacity: _animation,
            child: BackgroundImage(
                key: const ValueKey(2),
                currentBackgroundIndex: _currentBackgroundIndex),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Text(
                      'TOM\nDeaf and Hard of Hearing\nVideo Relay Services',
                      style: AppTextStyle.titleWhiteFont,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Hero(
                      tag: 'logo',
                      child: Image(
                        height: 100,
                        image: AssetImage('images/logo.png'),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Hero(
                      tag: 'Login-Button',
                      child: RoundedButton(
                        label: 'Login',
                        onPressed: () =>
                            Navigator.pushNamed(context, LoginScreen.id),
                      ),
                    ),
                    const SizedBox(
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
        ]),
      ),
    );
  }
}
