import 'package:flutter/material.dart';
import 'package:todo_app/controllers/login_controller.dart';

class CustomLoginButton extends StatelessWidget {

  final LoginController controller;

  const CustomLoginButton({ Key? key, required this.controller }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
              valueListenable: controller.isLoading, 
              builder: (_, isLoading, __) => listenableBuilderReturn(isLoading, context)
            );
  }

  Widget listenableBuilderReturn(bool isLoading, BuildContext context) {
    return isLoading ? CircularProgressIndicator(
          color: Colors.blue.shade900
          ) :
          ElevatedButton(
            onPressed: () => controller.auth().then((value) => loginResult(value, context)),
            child: Text("Login"),
          ); 
  }

  SnackBar snackBarActionError(){
    return SnackBar(
      content: const Text("Failed. Email or password was incorrect."),
      duration: const Duration(seconds: 3)
    );
  }

  void loginResult(bool value, BuildContext context) {
    if (value) {
      print('loginResult::Success');
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      print('loginResult::Failed');
      ScaffoldMessenger.of(context).showSnackBar(snackBarActionError());
    }
  }
}