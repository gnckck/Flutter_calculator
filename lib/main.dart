import 'package:flutter/material.dart';

void main() {
  runApp(const Project2());
}

class Project2 extends StatelessWidget {
  const Project2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatelessWidget {
  Calculator({super.key});

  final btnNumColor = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 200, 222, 241),
    minimumSize: const Size(100, 80),
  );
  final btnSymbolColor = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 154, 205, 250),
    minimumSize: const Size(100, 80),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('투박한 계산기'),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            height: 550,
            child: Column(
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 360,
                      height: 30,
                      child: Text(
                        '135 + 6 =',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 363,
                      height: 50,
                      child: Text(
                        '141',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: btnSymbolColor,
                        child: const Text('('),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnSymbolColor,
                        child: const Text(')'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnSymbolColor,
                        child: const Text('%'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnSymbolColor,
                        onPressed: () {},
                        child: const Text('CE'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: btnNumColor,
                        child: const Text('7'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnNumColor,
                        child: const Text('8'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnNumColor,
                        child: const Text('9'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnSymbolColor,
                        onPressed: () {},
                        child: const Text('÷'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: btnNumColor,
                        child: const Text('4'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnNumColor,
                        child: const Text('5'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnNumColor,
                        child: const Text('6'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnSymbolColor,
                        onPressed: () {},
                        child: const Text('x'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: btnNumColor,
                        child: const Text('1'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnNumColor,
                        onPressed: () {},
                        child: const Text('2'),
                      ),
                      ElevatedButton(
                        style: btnNumColor,
                        child: const Text('3'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnSymbolColor,
                        onPressed: () {},
                        child: const Text('-'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: btnNumColor,
                        child: const Text('0'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnNumColor,
                        onPressed: () {},
                        child: const Text('.'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 80)),
                        child: const Text('='),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: btnSymbolColor,
                        onPressed: () {},
                        child: const Text('+'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
