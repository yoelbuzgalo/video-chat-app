import 'dart:async';

import 'package:video_call_test/models/user_information.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:video_call_test/models/user_credential.dart';

enum StatusType {
  success,
  fail,
}

class Status {
  final StatusType _status;
  final String? _errorMessage;
  const Status({required status, errorMessage})
      : this._status = status,
        this._errorMessage = errorMessage;
  StatusType get getStatus => this._status;
  String? get getErrorMessage => this._errorMessage;
}

class Accounts {
  static Future<Status> createAccount(
      {required String emailAddressInput,
      required String passwordInput,
      required String nameInput,
      required String teodatZehutInput}) async {
    try {
      UserInformation newUserInformation = UserInformation(
          nameInput: nameInput, teodatZehutInput: teodatZehutInput);
      http.Response request = await createAuthRequest(
          email: emailAddressInput,
          password: passwordInput,
          name: newUserInformation.name,
          teodatZehut: newUserInformation.teodatZehut);
      var data = jsonDecode(request.body);
      if (request.statusCode != 200) {
        //Specifically only for Auth Errors (401)
        if (request.statusCode == 401) {
          String authErrorCode = data['code'];
          switch (authErrorCode) {
            case 'auth/invalid-email':
              return const Status(
                  status: StatusType.fail, errorMessage: 'Invalid email');
            case 'auth/email-in-already-use':
              return const Status(
                  status: StatusType.fail,
                  errorMessage: 'Account already exists for that email');
            case 'auth/weak-password':
              return const Status(
                  status: StatusType.fail,
                  errorMessage: 'Password is too weak');
            default:
              return Status(
                  status: StatusType.fail,
                  errorMessage: 'Authentication error: $authErrorCode');
          }
        }
        //Returns any other server errors not related to 401 (auth backend)
        return Status(
            status: StatusType.fail,
            errorMessage: '${request.statusCode}: ${data['error']['message']}');
      }
      UserCredential user = new UserCredential();
      user.setUid(data['user']['uid']);
    } on UserInformationException catch (error) {
      return Status(
          status: StatusType.fail,
          errorMessage: 'User Information Input Error: ${error.message}');
    }
    return const Status(status: StatusType.success);
  }

  static Future<Status> loginAccount(
      {required String emailAddressInput,
      required String passwordInput}) async {
    http.Response request = await loginAuthRequest(
        email: emailAddressInput, password: passwordInput);
    var data = jsonDecode(request.body);
    if (request.statusCode != 200) {
      //Specifically only for Auth Errors (401)
      if (request.statusCode == 401) {
        String authErrorCode = data['code'];
        switch (authErrorCode) {
          case 'auth/invalid-email':
            return const Status(
                status: StatusType.fail, errorMessage: 'Invalid email');
          case 'auth/user-not-found':
            return const Status(
                status: StatusType.fail, errorMessage: 'User does not exist');
          case 'auth/wrong-password':
            return const Status(
                status: StatusType.fail, errorMessage: 'Wrong password');
          default:
            return Status(
                status: StatusType.fail,
                errorMessage: 'Authentication error: $authErrorCode');
        }
      }
      //Returns any other server errors not related to 401 (auth backend)
      return Status(
          status: StatusType.fail,
          errorMessage: '${request.statusCode}: ${data['error']['message']}');
    }
    UserCredential user = new UserCredential();
    user.setUid(data['user']['uid']);
    return const Status(status: StatusType.success);
  }

  static Future<http.Response> createAuthRequest(
      {required String email,
      required String password,
      required String name,
      required String teodatZehut}) {
    return http
        .post(
          Uri.parse('http://192.168.1.229:3000/createuser'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
            'name': name,
            'teodatZehut': teodatZehut,
          }),
        )
        .timeout(const Duration(seconds: 5), onTimeout: () => throw 504)
        .catchError(
      (error) {
        if (error == 504) {
          return http.Response(
              '{"error": {"message" : "gateway timeout, no response from server"}}',
              504);
        }
        return http.Response('{"error" : {"message" : "$error"}}', 500);
      },
    );
  }

  static Future<http.Response> loginAuthRequest(
      {required String email, required String password}) {
    return http
        .post(
          Uri.parse('http://192.168.1.229:3000/loginuser'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'email': email,
              'password': password,
            },
          ),
        )
        .timeout(const Duration(seconds: 5), onTimeout: () => throw 504)
        .catchError(
      (error) {
        if (error == 504) {
          return http.Response(
              '{"error": {"message": "gateway timeout no response from server"}}',
              504);
        }
        return http.Response('{"error": {"message" : "$error"}}', 500);
      },
    );
  }
}
