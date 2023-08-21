import 'package:flutter/material.dart';
import 'package:todo_app/screens/myapp.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.from(
        
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 255, 191, 14),
          onPrimaryContainer: Colors.amber,
         // brightness: Brightness.light,
          onBackground: Color.fromARGB(255, 255, 255, 255),
          onPrimary: Color.fromARGB(255, 255, 255, 255),
          primary: Colors.amber
        ),
      ),
      title: "ToDo App",
      home: MyApp(),
    ),
  );
}
