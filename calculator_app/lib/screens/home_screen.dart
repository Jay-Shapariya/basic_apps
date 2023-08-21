import 'package:calculator_app/widget/buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: const Color.fromARGB(60, 236, 224, 182),
        child: const Center(
          child: Buttons()
      ),
    )
    );
  }
}
