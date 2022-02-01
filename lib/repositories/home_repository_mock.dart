import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:todo_app/models/post_model.dart';
import 'package:todo_app/repositories/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<Post>> getList() async {
    // TODO: implement getList

    var value = await rootBundle.loadString('assets/data.json');

    List postJson = jsonDecode(value);

    return postJson.map((e) => Post.fromJson(e)).toList();
  }
}