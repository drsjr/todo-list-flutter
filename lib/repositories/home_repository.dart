import 'package:todo_app/models/post_model.dart';

abstract class HomeRepository {


  Future<List<Post>> getList();

}