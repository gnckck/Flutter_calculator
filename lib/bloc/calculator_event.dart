part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class RemoveNum extends CalculatorEvent {}

class AddNum extends CalculatorEvent {
  final String number;
  AddNum(this.number);
}
