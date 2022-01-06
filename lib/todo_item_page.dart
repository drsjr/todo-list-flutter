import 'package:flutter/material.dart';

class TodoItemPage extends StatelessWidget {
  // final String itemText;
  // TodoItemPage(this.itemText);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop("returnar argument");
            }
          },
          child: Text(args),
        )
      ),
    );
  }
}