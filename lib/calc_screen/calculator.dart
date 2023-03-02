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

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    bool isDigit(String keyPad) => RegExp(r'\d').hasMatch(keyPad);
    bool isOperator(String keyPad) => RegExp(r'[\+\-\÷\×\%]').hasMatch(keyPad);
    bool isRemoveNum(String keyPad) => keyPad == 'CE';
    bool isResultOperator(String keyPad) => keyPad == '=';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('투박한 계산기'),
        centerTitle: true,
      ),
      body: SafeArea(
          // 컨텐츠가 가려지지 않는 영역
          // UI가 제대로 보여지기 위해 감싸줌
          child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  // Row,Column,Flex의 자식으로 사용가능하며,
                  // 부모의 남은 부분은 전부 채우는 식으로 화면에 나타남
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
                            onPressed: () => calculatorBloc.add(getEvent(e))))
                        .toList(),
                  ),
                )
              ],
            )),
      )),
    );
  }
}
