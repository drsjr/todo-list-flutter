import 'package:flutter/material.dart';
import 'package:todo_app/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ Key? key }) : super(key: key);

  final LoginController _controller = LoginController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 64.0,),

            Icon(Icons.people, size: 128.0),

            SizedBox(height: 16.0,),

            TextField(
              onChanged: _controller.setLogin,
              decoration: InputDecoration(
                label: Text("Email"),
              ),
            ),

            TextField(
              onChanged: _controller.setPassword,
              decoration: InputDecoration(
                label: Text("Password"),
              ),
              obscureText: true,
            ),

            SizedBox(height: 32.0),

            ValueListenableBuilder<bool>(
              valueListenable: _controller.isLoading, 
              builder: (_, isLoading, __) => listenableBuilderReturn(isLoading, context)
            )
            
          ]
        )
      ),
    );
  }

  Widget listenableBuilderReturn(bool isLoading, BuildContext context) {
    return isLoading ? CircularProgressIndicator(
          color: Colors.blue.shade900
          ) :
          ElevatedButton(
            onPressed: () => _controller.auth().then((value) => loginResult(value, context)),
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
      Navigator.of(context).pushReplacementNamed('/todoList');
    } else {
      print('loginResult::Failed');
      ScaffoldMessenger.of(context).showSnackBar(snackBarActionError());
    }
  }

}
