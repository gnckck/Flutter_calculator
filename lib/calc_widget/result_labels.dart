import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/calc_widget/sub_result.dart';
import '../bloc/calculator_bloc.dart';
import 'calc_result.dart';

class ResultLables extends StatelessWidget {
  const ResultLables({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Column(
          children: [
            // SubResult(text: state.firstNum),
            // SubResult(text: state.operation),
            // SubResult(text: state.secondNum),
            SubResultScreen(text: state.subExpression),
            ResultScreen(text: state.mainExpression),
            // ResultScreen 처럼 위에 계산식 스크린도 만들어야함!!
          ],
        );
      },
    );
  }
}
