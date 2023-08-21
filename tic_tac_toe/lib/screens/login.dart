import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  
  final TextEditingController _player1 = TextEditingController();
  final TextEditingController _player2 = TextEditingController();

  @override
  void dispose() {
    _player1.dispose();
    _player2.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Card(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: const Color.fromARGB(255, 220, 222, 255),
        child: IntrinsicHeight(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _player1,
                decoration: const InputDecoration(hintText: 'abc',contentPadding: EdgeInsets.all(2),label: Text('Enter player 1 name'),),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _player2,
                decoration: const InputDecoration(hintText: 'xyz',contentPadding: EdgeInsets.all(2),label: Text('Enter player 2 name'),),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  String player1name = _player1.text;
                  String player2name = _player2.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen(player1name: player1name,player2Name: player2name,pl1: 0,pl2: 0,);
                  },));
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                child: const Text("Let's Play"),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
