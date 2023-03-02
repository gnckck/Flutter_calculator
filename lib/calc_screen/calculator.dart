import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/calculator_bloc.dart';
import '../calc_widget/calc_button.dart';
import '../calc_widget/result_labels.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
    // List numbers = List.generate(10, ((index) => index.toString()));
    // numbers.map(
    //   (e) => CalculatorButton(
    //     text: e,
    //     onPressed: () => calculatorBloc.add(
    //       AddNum(e),
    //     ),
    //   ),
    // );

    // getEvent(String keyPad){
    //   if(isDigit(keyPad)){
    //     return AddNum(keyPad);
    //   }
    //   if(isOperator(keyPad))
    //     return AddOperator(operator)
    // }

    // ['0','1','+'].map((e) => CalculatorButton(
    //   text: e,
    //   onPressed: () => calculatorBloc.add(getEvent(e)!),
    // ));
    // const ['(',')','%','CE','7']
    // keypads.map

    ['(', ')', '%', 'CE'].map((e) => CalculatorButton(
          text: e,
          onPressed: () => calculatorBloc.add(KeyPressed(e)),
        ));

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
                const ResultLables(), // 결과창
                // GridView.count(crossAxisCount: 4, children: keypads.map(...).toList(),)

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '(',
                      onPressed: () => calculatorBloc.add(AddNum('(')),
                    ),
                    CalculatorButton(
                      text: ')',
                      onPressed: () => calculatorBloc.add(AddNum(')')),
                    ),
                    CalculatorButton(
                      text: '%',
                      onPressed: () => calculatorBloc.add(AddOperator('%')),
                    ),
                    CalculatorButton(
                      text: 'CE',
                      onPressed: () => calculatorBloc.add(RemoveNum()),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '7',
                      onPressed: () => calculatorBloc.add(AddNum('7')),
                    ),
                    CalculatorButton(
                      text: '8',
                      onPressed: () => calculatorBloc.add(AddNum('8')),
                    ),
                    CalculatorButton(
                      text: '9',
                      onPressed: () => calculatorBloc.add(AddNum('9')),
                    ),
                    CalculatorButton(
                      text: 'x',
                      onPressed: () => calculatorBloc.add(AddOperator('×')),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '4',
                      onPressed: () => calculatorBloc.add(AddNum('4')),
                    ),
                    CalculatorButton(
                      text: '5',
                      onPressed: () => calculatorBloc.add(AddNum('5')),
                    ),
                    CalculatorButton(
                      text: '6',
                      onPressed: () => calculatorBloc.add(AddNum('6')),
                    ),
                    CalculatorButton(
                      text: '÷',
                      onPressed: () => calculatorBloc.add(AddOperator('÷')),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '1',
                      onPressed: () => calculatorBloc.add(AddNum('1')),
                    ),
                    CalculatorButton(
                      text: '2',
                      onPressed: () => calculatorBloc.add(AddNum('2')),
                    ),
                    CalculatorButton(
                      text: '3',
                      onPressed: () => calculatorBloc.add(AddNum('3')),
                    ),
                    CalculatorButton(
                      text: '-',
                      onPressed: () => calculatorBloc.add(AddOperator('-')),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '0',
                      onPressed: () => calculatorBloc.add(AddNum('0')),
                    ),
                    CalculatorButton(
                      text: '.',
                      onPressed: () => calculatorBloc.add(AddNum('.')),
                    ),
                    CalculatorButton(
                      text: '=',
                      onPressed: () => calculatorBloc.add(ResultOperator()),
                    ),
                    CalculatorButton(
                      text: '+',
                      onPressed: () => calculatorBloc.add(AddOperator('+')),
                    ),
                  ],
                ),
              ],
            )),
      )),
    );
  }
}
