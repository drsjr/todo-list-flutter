import 'package:flutter/material.dart';
import 'package:todo_app/components/login/custon_login_buttom.dart';
import 'package:todo_app/controllers/login_controller.dart';
import 'package:todo_app/widgets/custom_text_field_widget.dart';

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

            CustomTextFieldWidget(
              onChanged: _controller.setLogin,
              label: "Email",
              obscureText: false
            ),

            CustomTextFieldWidget(
              onChanged: _controller.setLogin,
              label: "Password",
              obscureText: true
            ),

            SizedBox(height: 32.0),

            CustomLoginButton(
              controller: _controller)
            
          ]
        )
      ),
    );
  }
}
