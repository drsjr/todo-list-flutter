import 'package:flutter/material.dart';

class CustomButtonWidget  extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool disable;
  final double titleSize;

  CustomButtonWidget(this.onPressed, this.title, this.disable, {this.titleSize = 18});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ButtonStyle(

        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) return Colors.red;
          if (states.contains(MaterialState.pressed)) return Colors.blue;
          return Colors.green;
        }),

        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0))),

        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) return TextStyle(fontSize: titleSize * 2);
          return TextStyle(fontSize: titleSize);
        })

      ),
      onPressed: disable ? null : onPressed, 
      child: Text(title));
  }
}