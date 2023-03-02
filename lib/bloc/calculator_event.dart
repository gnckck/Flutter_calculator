part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class RemoveNum extends CalculatorEvent {}

class AddNum extends CalculatorEvent {
  final String number;
  AddNum(this.number);
}

class AddOperator extends CalculatorEvent {
  final String operator;
  AddOperator(this.operator);
}

class ResultOperator extends CalculatorEvent {}

class KeyPressed extends CalculatorEvent {
  final String pad;
  KeyPressed(this.pad);
}
