import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart' as math;

class Buttons extends StatefulWidget {
  const Buttons({
    super.key,
  });

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  String _result = '';
  String _ans = '';
  int _dot = 0;
  int _currentIndex = 0;
  String _changeOpr = '+';
  int _currentParentheses = 0;
  bool _isDivide = false;

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _result);
  }

  void _parentheses() {
    if (_currentParentheses == 0) {
      _addToResult('(');
      _currentParentheses += 1;
    } else {
      _addToResult(')');
      _currentParentheses -= 1;
    }
  }

  void _getPersentage() {
    final parser = math.Parser();
    final expression = parser.parse(_result);
    final context = math.ContextModel();
    print('_isDivide= $_isDivide');
    if (_isDivide == true) {
      _result = expression.evaluate(math.EvaluationType.REAL, context) *
          100.toString();
    } else {
      _result = expression.evaluate(math.EvaluationType.REAL, context) /
          100.toString();
    }
  }

  void _addToResult(String value) {
    setState(() {
      _result += value;
      _controller.text = _result;
    });
  }

  void _calculateResult() {
    setState(() {
      try {
        final parser = math.Parser();
        final expression = parser.parse(_result);
        final context = math.ContextModel();

        _ans =
            expression.evaluate(math.EvaluationType.REAL, context).toString();
      } catch (e) {
        _ans = 'Error';
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = (MediaQuery.of(context).size.height);
    final h1 = h / 4;

    final h3 = h1 * 2 / 3;
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: h1,
          child: Column(
            children: [
              Container(
                height: h3,
                alignment: Alignment.topRight,
                color: const Color.fromARGB(24, 236, 224, 182),
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Expression',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  keyboardType: TextInputType.none,
                  style: const TextStyle(fontSize: 25),
                  controller: _controller,
                  textAlign: TextAlign.right,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  },
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                color: const Color.fromARGB(24, 236, 224, 182),
                child: Text(
                  _ans,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: GestureDetector(
                  onTap: () {
                    _result = _result.substring(0, _result.length - 1);
                    _controller.text = _result;
                  },
                  child: const Icon(
                    Icons.backspace_outlined,
                    color: Color.fromARGB(255, 202, 82, 73),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: h,
              color: const Color.fromARGB(116, 255, 248, 195),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _result = '';
                            _controller.text = '';
                            _ans = '';
                            _dot = 0;
                            _currentIndex = 0;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 255, 127, 127)),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text(
                          'C',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _dot = 0;
                          _parentheses();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 127, 159, 255)),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text(
                          '()',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('%');
                          _getPersentage();
                          _dot = 0;
                          _currentIndex = _result.indexOf('%') + 1;
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 127, 159, 255)),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text(
                          '%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('/');
                          _dot = 0;
                          _isDivide = true;
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 127, 159, 255)),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text(
                          '÷',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('7');
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('7'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('8');
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('8'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('9');
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('9'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _dot = 0;
                          _addToResult('*');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 127, 159, 255)),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text(
                          'x',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('4');
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('4'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('5');
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('5'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('6');
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('6'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('-');
                          _dot = 0;
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 127, 159, 255)),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text(
                          '-',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('1');
                        },
                        child: const Text('1'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('2');
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('2'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('3');
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('3'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('+');
                          _dot = 0;
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 127, 159, 255)),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text(
                          '+',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_changeOpr == '+') {
                            _result =
                                '${_result.substring(0, _currentIndex)}(-${_result.substring(_currentIndex + 1)}';
                            _controller.text = _result;
                            _changeOpr = '-';
                          } else {
                            _result =
                                '${_result.substring(0, _currentIndex)}${_result.substring(_currentIndex + 1)}';
                            _controller.text = _result;
                            _changeOpr = '+';
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 127, 159, 255)),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text(
                          '+/-',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addToResult('0');
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('0'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_dot == 0) {
                            _addToResult('.');
                            _dot += 1;
                          } else {
                            _addToResult('');
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text('.'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _calculateResult();
                          _dot = 0;
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 127, 255, 131)),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(40, 40),
                          ),
                        ),
                        child: const Text(
                          '=',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
