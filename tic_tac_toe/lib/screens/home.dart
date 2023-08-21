import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/login.dart';
import 'package:tic_tac_toe/widgets/gridmain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.player1name, required this.player2Name,required this.pl1,required this.pl2});
  final String player1name;
  final String player2Name;
  final int pl1;
  final int pl2;
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late LoginScreen loginScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(153, 208, 216, 255),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.player1name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                      Text(widget.pl1.toString()
                        ,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(widget.player2Name
                        ,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                      Text(
                        widget.pl2.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: GridWidget(player1name: widget.player1name,player2name: widget.player2Name,P1: widget.pl1,P2: widget.pl2,))
        ],
      ),
    );
  }
}
