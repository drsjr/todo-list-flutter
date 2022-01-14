import 'package:flutter/material.dart';
import 'package:todo_app/views/login_page.dart';
import 'package:todo_app/views/splash_page.dart';
import 'package:todo_app/views/todo_item_page.dart';
import 'package:todo_app/views/todo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes:  {
        '/splash': (_) => SplashPage(),
        '/login': (_) => LoginPage(),
        '/todoList': (_) => TodoListPage(),
        '/todoItem': (_) => TodoItemPage(),
      },
    );
  }
}
