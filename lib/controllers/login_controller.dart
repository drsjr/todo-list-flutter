import 'package:flutter/material.dart';

class LoginController {

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  String? _login;

  String? _password;

  void setLogin(String value) => _login = value;

  void setPassword(String value) => _password = value;


  Future<bool> auth() async {
    print('Login: $_login, Password: $_password');
    //TODO: call server to do the login...
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 2)).then((value) {
        isLoading.value = false;
    });


    return (_login != null && _password != null && _login!.length > 3);
  }

}