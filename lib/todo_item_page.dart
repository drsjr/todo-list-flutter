import 'package:flutter/material.dart';

import 'widgets/custom_button_widget.dart';

class TodoItemPage extends StatelessWidget {
  // final String itemText;
  // TodoItemPage(this.itemText);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomButtonWidget(
          () {

          }, 
          args, 
          false)
      ),
    );
  }
}