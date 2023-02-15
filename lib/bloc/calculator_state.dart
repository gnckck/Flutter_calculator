part of 'calculator_bloc.dart';

class CalculatorState {
  final String resultText;
  final String firstNum;
  final String secondNum;
  final String operation;

  CalculatorState({
    this.resultText = '0',
    this.firstNum = '30',
    this.secondNum = '20',
    this.operation = '+',
  });
}
