import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_list.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/add.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TodoList todoList = TodoList();
  void _addTask(Todo task) {
    setState(() {
      todoList.todos.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (todoList.todos.isEmpty) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('Todo app'),
      ),
      floatingActionButton: OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AddTodo(
                onAddTask: _addTask,
              );
            }),
          );
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.amber),
          fixedSize: MaterialStatePropertyAll(Size(40, 40)),
          shape: MaterialStatePropertyAll(
            CircleBorder(),
          ),
        ),
        child: const Text("+",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.justify),
      ), 
      body: const Center(
        child: Text('Add Task'),
      ),
      );
      
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo app'),
      ),
      floatingActionButton: OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AddTodo(
                onAddTask: _addTask,
              );
            }),
          );
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.amber),
          fixedSize: MaterialStatePropertyAll(Size(40, 40)),
          shape: MaterialStatePropertyAll(
            CircleBorder(),
          ),
        ),
        child: const Text("+",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.justify),
      ),
      body: ListView.builder(
        itemCount: todoList.todos.length,
        itemBuilder: (context, index) {
          Todo todo = todoList.todos[index];
          return Card(
            child: ListTile(
              title: Text(todo.title),
              leading: Checkbox(
                value: todo.completed,
                onChanged: (value) {
                  setState(() {
                    todo.completed = value ?? false;
                  });
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    todoList.todos.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
