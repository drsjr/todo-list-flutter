import 'package:flutter/material.dart';
import 'package:todo_app/todo_item_page.dart';

class TodoListPage extends StatefulWidget {
  //const TodoListPage({ Key? key }) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  List<String> _tarefas = [];

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Container(
              height: 300,
              child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tarefas[index]),
                  onTap: () {
                    openItemPage(context, _tarefas[index]);
                  },
                  onLongPress: () {
                    removeItem(index);
                  },
                );
              },
              itemCount: _tarefas.length,),
            )
            
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            backgroundColor: Colors.blue[400],
            child: Icon(Icons.add),
            onPressed: () {
              addItemToList();
              print(_textEditingController.text);
              print(_tarefas.toString());
            },
          ),

          FloatingActionButton(
            backgroundColor: Colors.blue[400],
            child: Icon(Icons.remove),
            onPressed: () {
              cleanList();
              print(_textEditingController.text);
              print(_tarefas.toString());
            },
          ),
        ],
      )
    );
  }

  void addItemToList() {
    if (_textEditingController.text.length > 0) {
      setState(() {
         _tarefas.add(_textEditingController.text);
        _textEditingController.clear();
        }
      );
    }
  }

  void cleanList() {
    setState(() {
        _tarefas.clear();
        _textEditingController.clear();
      }
    );
  }

  void removeItem(int index) {
    setState(() {
      _tarefas.removeAt(index);      
    });
  }

  void openItemPage(BuildContext context, String todoItem) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => TodoItemPage(todo))
    // );
    Navigator.of(context).pushNamed('/todoItem', arguments: todoItem).then((value) => {
      print(value)
    });
  }
}