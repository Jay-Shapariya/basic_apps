import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/home.dart';
import 'package:tic_tac_toe/screens/login.dart';

// ignore: must_be_immutable
class GridWidget extends StatefulWidget {
  GridWidget(
      {super.key,
      required this.player1name,
      required this.player2name,
      // ignore: non_constant_identifier_names
      required this.P1,
      // ignore: non_constant_identifier_names
      required this.P2});
  final String player1name;
  final String player2name;
  // ignore: non_constant_identifier_names
  int P1;
  // ignore: non_constant_identifier_names
  int P2;
  @override
  State<StatefulWidget> createState() {
    return _GridWidgetState();
  }
}

class _GridWidgetState extends State<GridWidget> {
  int count = 0;
  String winPlayer = "";
  String first = "O";
  String second = "X";
  List<String> output = List.filled(9, '');

  void checkCount(int index) {
    if (count % 2 == 0 && output[index] == "") {
      output[index] = "X";
    } else if (count % 2 != 0 && output[index] == "") {
      output[index] = "O";
    }
    if (count >= 4) {
      checkWin();
    }

    count++;
  }

  void checkWin() {
    if ((output[1] == output[2] && output[2] == output[0]) &&
        (output[1] == "X" || output[1] == "O")) {
      if (output[0] == "X") {
        winPlayer = widget.player1name;
      } else {
        winPlayer = widget.player2name;
      }
      showWinnerDialog(winPlayer);
    } else if ((output[4] == output[5] && output[5] == output[3]) &&
        (output[4] == "X" || output[4] == "O")) {
      if (output[4] == "X") {
        winPlayer = widget.player1name;
      } else {
        winPlayer = widget.player2name;
      }
      showWinnerDialog(winPlayer);
    } else if ((output[7] == output[8] && output[8] == output[6]) &&
        (output[7] == "X" || output[7] == "O")) {
      if (output[7] == "X") {
        winPlayer = widget.player1name;
      } else {
        winPlayer = widget.player2name;
      }
      showWinnerDialog(winPlayer);
    } else if ((output[0] == output[4] && output[4] == output[8]) &&
        (output[0] == "X" || output[0] == "O")) {
      if (output[0] == "X") {
        winPlayer = widget.player1name;
      } else {
        winPlayer = widget.player2name;
      }
      showWinnerDialog(winPlayer);
    } else if ((output[2] == output[4] && output[4] == output[6]) &&
        (output[2] == "X" || output[2] == "O")) {
      if (output[2] == "X") {
        winPlayer = widget.player1name;
      } else {
        winPlayer = widget.player2name;
      }
      showWinnerDialog(winPlayer);
    }
    else if ((output[0] == output[3] && output[3] == output[6]) &&
        (output[0] == "X" || output[4] == "O")) {
      if (output[0] == "X") {
        winPlayer = widget.player1name;
      } else {
        winPlayer = widget.player2name;
      }
      showWinnerDialog(winPlayer);
    }
    else if ((output[4] == output[1] && output[1] == output[7]) &&
        (output[4] == "X" || output[4] == "O")) {
      if (output[4] == "X") {
        winPlayer = widget.player1name;
      } else {
        winPlayer = widget.player2name;
      }
      showWinnerDialog(winPlayer);
    }
    else if ((output[2] == output[5] && output[5] == output[8]) &&
        (output[2] == "X" || output[2] == "O")) {
      if (output[2] == "X") {
        winPlayer = widget.player1name;
      } else {
        winPlayer = widget.player2name;
      }
      showWinnerDialog(winPlayer);
    }
    if (count >= 8) {
      showDraw();
    }
    if (winPlayer == widget.player1name) {
      widget.P1 += 1;
    }
    if (winPlayer == widget.player2name) {
      widget.P2 += 1;
    }
  }

  void showWinnerDialog(String winPlayer) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Winner'),
          content: Text("Player $winPlayer win!"),
          actions: <Widget>[
            TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ));
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reset')),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen(
                        player1name: widget.player1name,
                        player2Name: widget.player2name,
                        pl1: widget.P1,
                        pl2: widget.P2,
                      );
                    },
                  ));
                },
                child: const Text('Rematch')),
          ],
        );
      },
    );
  }

  void showDraw() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Match Drawn'),
          content: const Text('Do you want play again'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen(
                        player1name: widget.player1name,
                        player2Name: widget.player2name,
                        pl1: widget.P1,
                        pl2: widget.P2,
                      );
                    },
                  ));
                },
                child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ));
                },
                child: const Text('No'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              checkCount(index);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  checkCount(index);
                });
              },
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(5)),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 195, 218, 255)),
                  alignment: Alignment.center,
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))))),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    output[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.vertical,
    );
  }
}
