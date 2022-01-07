import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets/custom_button_widget.dart';

class TodoItemPage extends StatefulWidget {
  // final String itemText;
  // TodoItemPage(this.itemText);

  @override
  _TodoItemPageState createState() => _TodoItemPageState();
}

class _TodoItemPageState extends State<TodoItemPage> {

  ValueNotifier<int> valor = ValueNotifier<int>(0);

  random() async {
    for (int i = 0; i<10; i++) {
      await Future.delayed(Duration(seconds: 1));
      valor.value = Random().nextInt(1000);   
    }
  }


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as String;
    print("build");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: valor, 
              builder: (_, valor1, __) => Text(
                'O valor aleatorio eh: $valor1', 
                style: TextStyle(fontSize: 20.0))
            ),
            SizedBox(height: 16),
            CustomButtonWidget(
              () {
                random();
                //Navigator.of(context).pop();
              }, 
              args, 
              false)
          ],
        ),
      )
    );
  }
}