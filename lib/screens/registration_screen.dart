import 'package:flutter/material.dart';
import 'package:video_call_test/constants.dart';
import 'package:video_call_test/components/rounded_text_field.dart';
import 'package:video_call_test/components/rounded_button.dart';
import 'package:video_call_test/components/sign_up_animation.dart';
import 'package:video_call_test/screens/call_start.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:video_call_test/models/accounts.dart';
import 'package:video_call_test/components/error_message.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _nameInput = '';
  String _teodatZehutInput = '';
  String _emailAddressInput = '';
  String _passwordInput = '';
  bool _creatingAccount = false;
  bool _errorBoolean = false;
  String _errorMessage = '';

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
        inAsyncCall: _creatingAccount,
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
                Container(
                  height: 130,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColor.darkerNavyBlue.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: SignUpAnimationText(),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Registration:',
                  style: AppTextStyle.bigWhiteFont,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: RoundedTextField(
                        onChangeCallback: (newValue) => _nameInput = newValue,
                        keyBoardType: TextInputType.name,
                        labelText: 'Name',
                        icon: Icons.person,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: RoundedTextField(
                        onChangeCallback: (newValue) =>
                            _teodatZehutInput = newValue,
                        keyBoardType: TextInputType.number,
                        labelText: 'Teodat Zehut',
                        icon: Icons.numbers,
                        maxLength: 9,
                        isDigitOnly: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
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
                  tag: 'Register-Button',
                  child: RoundedButton(
                    label: 'Register',
                    color: AppColor.navyBlue,
                    onPressed: () async {
                      setState(() => _creatingAccount = true);
                      Status accountCreation = await Accounts.createAccount(
                        emailAddressInput: _emailAddressInput,
                        passwordInput: _passwordInput,
                        nameInput: _nameInput,
                        teodatZehutInput: _teodatZehutInput,
                      );
                      if (accountCreation.getStatus == StatusType.success) {
                        Navigator.pushNamed(context, CallStart.id);
                      } else {
                        setState(() {
                          _errorMessage = accountCreation.getErrorMessage ??
                              'unexpected error, no error message was provided';
                          _errorBoolean = true;
                        });
                      }
                      setState(() => _creatingAccount = false);
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
