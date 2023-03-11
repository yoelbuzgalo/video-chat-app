import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:video_call_test/constants.dart';
import 'package:video_call_test/components/rounded_text_field.dart';
import 'package:video_call_test/components/rounded_button.dart';
import 'package:video_call_test/screens/call_start.dart';
import 'package:video_call_test/models/user_credential.dart';
import 'package:video_call_test/models/accounts.dart';
import 'package:video_call_test/components/error_message.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _emailAddressInput = '';
  String _passwordInput = '';
  bool _loggingIn = false;
  bool _errorBoolean = false;
  String _errorMessage = '';
  UserCredential userCredential = new UserCredential();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: _loggingIn,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Hero(
                  tag: 'logo',
                  child: Image(
                    height: 80,
                    image: AssetImage('images/logo.png'),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Login:',
                  style: AppTextStyle.bigWhiteFont,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                RoundedTextField(
                    onChangeCallback: (newValue) =>
                        _emailAddressInput = newValue,
                    keyBoardType: TextInputType.emailAddress,
                    labelText: 'Email',
                    icon: Icons.email),
                const SizedBox(height: 10),
                RoundedTextField(
                    onChangeCallback: (newValue) => _passwordInput = newValue,
                    keyBoardType: TextInputType.visiblePassword,
                    obscureText: true,
                    labelText: 'Password',
                    icon: Icons.password),
                const SizedBox(height: 10),
                ErrorMessage(
                    visible: _errorBoolean, errorMessage: _errorMessage),
                const SizedBox(height: 50),
                Hero(
                  tag: 'Login-Button',
                  child: RoundedButton(
                    label: 'Login',
                    color: AppColor.navyBlue,
                    onPressed: () async {
                      setState(() => _loggingIn = true);
                      Status accountLogin = await Accounts.loginAccount(
                        emailAddressInput: _emailAddressInput,
                        passwordInput: _passwordInput,
                      );
                      if (accountLogin.getStatus == StatusType.success) {
                        Navigator.pushNamed(context, CallStart.id);
                      } else {
                        setState(() {
                          _errorMessage = accountLogin.getErrorMessage ??
                              'unexpected error, no error message was provided';
                          _errorBoolean = true;
                        });
                      }
                      setState(() => _loggingIn = false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
