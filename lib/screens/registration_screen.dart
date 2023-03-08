import 'package:flutter/material.dart';
import 'package:video_call_test/constants.dart';
import 'package:video_call_test/components/background_image.dart';
import 'package:video_call_test/components/rounded_text_field.dart';
import 'package:video_call_test/components/rounded_button.dart';
import 'package:video_call_test/components/sign_up_animation.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'RegistrationScreen';
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  int _currentBackgroundIndex = 1;
  double _opacityLevel = 0;
  String _emailAddressInput = '';
  String _passwordInput = '';
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1), value: 0.0);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            FadeTransition(
              opacity: _animation,
              child: BackgroundImage(
                  currentBackgroundIndex: _currentBackgroundIndex),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image(
                      height: 80,
                      image: const AssetImage('images/logo.png'),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 130,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColor.darkerNavyBlue.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: SignUpAnimationText(
                        onNextBeforePauseCallback: (int index, bool isLast) =>
                            _controller.reverse(),
                        onNextCallback: (int index, bool isLast) {
                          setState(() => _currentBackgroundIndex < 3
                              ? _currentBackgroundIndex++
                              : _currentBackgroundIndex = 1);
                          _controller.forward();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  RoundedTextField(
                      onChangeCallback: (newValue) =>
                          _emailAddressInput = newValue,
                      keyBoardType: TextInputType.emailAddress,
                      icon: Icons.email),
                  SizedBox(height: 10),
                  RoundedTextField(
                      onChangeCallback: (newValue) => _passwordInput = newValue,
                      keyBoardType: TextInputType.visiblePassword,
                      obscureText: true,
                      icon: Icons.password),
                  SizedBox(height: 50),
                  Hero(
                    tag: 'Register-Button',
                    child: RoundedButton(
                        label: 'Register',
                        color: AppColor.darkerNavyBlue.withOpacity(0.7),
                        onPressed: () => null),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
