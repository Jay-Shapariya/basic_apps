import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_list.dart';
import 'package:todo_app/model/todo.dart';

class AddTodo extends StatefulWidget {
  final Function(Todo) onAddTask;
  const AddTodo({super.key,required this.onAddTask});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TodoList todoList = TodoList();
  final TextEditingController _textFieldController = TextEditingController();
  bool isCompleted = false;

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _handleAddTask(){
    final String taskName = _textFieldController.text;
    if(taskName.isNotEmpty){
      final Todo newTask = Todo(title: taskName, completed: isCompleted);
      widget.onAddTask(newTask);
      Navigator.of(context).pop();
    }
  }  

  void _handleRadioValueChanged(bool? value) {
    setState(() {
      isCompleted = value ?? false;
      
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            
            TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                labelText: 'Enter Task name',
                border: OutlineInputBorder(),
                hintText: 'Task1',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Is Task Completed or not...?',
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: isCompleted,
                        onChanged:_handleRadioValueChanged,
                      ),
                      const Text('True'),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: isCompleted,
                        onChanged: _handleRadioValueChanged,
                      ),
                      const Text('False'),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _handleAddTask,
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
