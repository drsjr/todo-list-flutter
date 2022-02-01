import 'package:flutter/material.dart';
import 'package:todo_app/controllers/home_controller.dart';
import 'package:todo_app/models/post_model.dart';
import 'package:todo_app/repositories/home_repository_mock.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController _controller = HomeController(HomeRepositoryMock());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<Post>>(
        valueListenable: _controller.posts, 
        builder: (_, list, __) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(
              title: Text(list[idx].title),)
            );
        }),

    );
  }
}