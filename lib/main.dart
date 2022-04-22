import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFF0a0e21),
          scaffoldBackgroundColor: const Color(0xFF0a0e21),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => InputPage(),
          '/results': (context) => ResultsPage(),
        });
  }
}
