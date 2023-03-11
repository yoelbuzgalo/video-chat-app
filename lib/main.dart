import 'package:flutter/material.dart';
import 'package:video_call_test/screens/welcome_screen.dart';
import 'package:video_call_test/screens/login_screen.dart';
import 'package:video_call_test/screens/registration_screen.dart';
import 'package:video_call_test/screens/call_start.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _precacheImages(BuildContext context) async {
    await Future.wait([
      precacheImage(const AssetImage('images/background_1.jpg'), context),
      precacheImage(const AssetImage('images/background_2.jpg'), context),
      precacheImage(const AssetImage('images/background_3.jpg'), context),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _precacheImages(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData.dark(),
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              LoginScreen.id: (context) => const LoginScreen(),
              RegistrationScreen.id: (context) => const RegistrationScreen(),
              CallStart.id: (context) => CallStart(),
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          ); // Placeholder widget until the images are precached.
        }
      },
    );
  }
}
