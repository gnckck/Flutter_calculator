import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/calculator_bloc.dart';
import '../calc_widget/calc_button.dart';
import '../calc_widget/result_labels.dart';

const List keypads = [
  '(',
  ')',
  '%',
  'CE',
  '7',
  '8',
  '9',
  '×',
  '4',
  '5',
  '6',
  '÷',
  '1',
  '2',
  '3',
  '-',
  '0',
  '.',
  '=',
  '+'
];

bool isDigit(String keyPad) => RegExp(r'\d').hasMatch(keyPad);
bool isOperator(String keyPad) => RegExp(r'[\+\-\÷\×\%]').hasMatch(keyPad);
bool isRemoveNum(String keyPad) => keyPad == 'CE';
bool isResultOperator(String keyPad) => keyPad == '=';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  CalculatorEvent getEvent(String keyPad) {
    if (isDigit(keyPad)) {
      return AddNum(keyPad);
    }
    if (isOperator(keyPad)) {
      return AddOperator(keyPad);
    }
    if (isRemoveNum(keyPad)) {
      return RemoveNum();
    }
    if (isResultOperator(keyPad)) {
      return ResultOperator();
    }
    return AddNum(keyPad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('투박한 계산기'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                const ResultLables(),
                SizedBox(
                  width: 500,
                  height: 650,
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: keypads
                        .map((e) => CalculatorButton(
                              text: e,
                              onPressed: () => context
                                  .read<CalculatorBloc>()
                                  .add(getEvent(e)),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
