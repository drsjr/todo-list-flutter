import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/widgets.dart';
import 'package:todo_app/models/post_model.dart';

class PostController {
  ValueNotifier<List<Post>> post = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

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
    } finally {
      client.close();
      loading.value = false;
    }
  }

}