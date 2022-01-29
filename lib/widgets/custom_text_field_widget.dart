import 'package:flutter/material.dart';
import 'package:todo_app/controllers/login_controller.dart';

class CustomTextFieldWidget extends StatelessWidget {

  final Function(String) onChanged;
  final String label;
  final bool obscureText;

  const CustomTextFieldWidget({ Key? key, 
    required this.onChanged,
    required this.label,
    required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(label),
        ),
        obscureText: obscureText,
      );
  }
}