import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/calculator_bloc.dart';
import 'calc_screen/calculator.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
      create: (_) => CalculatorBloc(),
      child: const MaterialApp(
        title: 'Calculator',
        home: Calculator(),
      ),
    );
  }
}
