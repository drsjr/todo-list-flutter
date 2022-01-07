import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'widgets/custom_button_widget.dart';

class TodoItemPage extends StatefulWidget {
  // final String itemText;
  // TodoItemPage(this.itemText);

  @override
  _TodoItemPageState createState() => _TodoItemPageState();
}

class _TodoItemPageState extends State<TodoItemPage> {

  ValueNotifier<bool> loading = ValueNotifier<bool>(false);
  ValueNotifier<List<Post>> post = ValueNotifier<List<Post>>([]);

  void random() async {
    // for (int i = 0; i<10; i++) {
    //   await Future.delayed(Duration(seconds: 1));
    //   post.value = _lista[Random().nextInt(_lista.length -1)];   
    // }
  }

  void callAPI() async {
    var client = http.Client();

    try {
      loading.value = true;
      var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'));
          
      var decodedResponse = jsonDecode(response.body) as List;
      post.value = decodedResponse.map((e) => Post.fromJson(e)).toList();

      post.value.forEach((element) => print(element));
      await Future.delayed(Duration(seconds: 2));
      //print(decodedResponse);
    } finally {
      client.close();
      loading.value = false;
    }
  }


  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context).settings.arguments as String;
    print("build");

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ValueListenableBuilder<List<Post>>(
            //   valueListenable: post, 
            //   builder: (_, lista, __) => ListView.builder(
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: lista.length,
            //     itemBuilder: (_, index) => ListTile(title: Text(lista[index].title),))
            // ), 

            AnimatedBuilder(
              animation: Listenable.merge([post, loading]), 
              builder: (_, __) => loading.value ? CircularProgressIndicator() :
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: post.value.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(post.value[index].title),
                ))
                ),

            SizedBox(height: 16),
            CustomButtonWidget(
              () {
                //random();
                callAPI();
                //Navigator.of(context).pop();
              }, 
              args, 
              false)
          ],
        ),
        ),
      )
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  String toString() {
    return '[userId: $userId, id: $id, title: $title]';
  }

  factory Post.fromJson(Map json) {
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }
}