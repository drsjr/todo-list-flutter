import 'package:flutter/material.dart';
import 'package:todo_app/controllers/post_controller.dart';
import '../widgets/custom_button_widget.dart';

class TodoItemPage extends StatefulWidget {
  // final String itemText;
  // TodoItemPage(this.itemText);

  @override
  _TodoItemPageState createState() => _TodoItemPageState();
}

class _TodoItemPageState extends State<TodoItemPage> {

  final PostController _controller = PostController();

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
              animation: Listenable.merge([_controller.post, _controller.loading]), 
              builder: (_, __) => _controller.loading.value ? CircularProgressIndicator() :
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _controller.post.value.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(_controller.post.value[index].title),
                ))
                ),

            SizedBox(height: 16),
            CustomButtonWidget(
              () {
                _controller.callAPI();
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