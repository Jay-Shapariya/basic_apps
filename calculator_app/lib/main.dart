import 'package:calculator_app/screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          
          seedColor: Colors.amber,
        ),
      
      ),
      home: const HomeScreen(),
    );
  }
}
