import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/post_model.dart';
import 'package:todo_app/repositories/home_repository.dart';

class HomeController {

  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);

  void fetch() async {
    posts.value = await _homeRepository.getList();
  }

}