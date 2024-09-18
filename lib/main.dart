import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<String> _todoList = [];
  final TextEditingController _todoController = TextEditingController();

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoList.add(task);
      });
      _todoController.clear();
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text('To-Do List'),
        titleTextStyle: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 30,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 1.0,
        ),
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _todoController,
              decoration: InputDecoration(
                labelText: 'Enter a Task',
                border: OutlineInputBorder(),
              ),
              onSubmitted: _addTodoItem,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todoList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeTodoItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodoItem(_todoController.text),
        child: Icon(Icons.add),
      ),
    );
  }
}
