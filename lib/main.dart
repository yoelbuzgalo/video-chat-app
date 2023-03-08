import 'package:flutter/material.dart';
import 'package:video_call_test/screens/welcome_screen.dart';
import 'package:video_call_test/screens/registration_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/background_1.jpg'), context);
    precacheImage(AssetImage('images/background_2.jpg'), context);
    precacheImage(AssetImage('images/background_3.jpg'), context);
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
