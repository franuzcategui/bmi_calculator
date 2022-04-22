import 'dart:math';

class BMICalculatorBrain {
  final int? weight;
  final int? height;
  final int? age;
  double _bmi = 0;

  BMICalculatorBrain({this.weight, this.height, this.age}) {
    _bmi = weight! / pow(height! / 100, 2);
  }

  String bmi() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String status() {
    if (_bmi > 30) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Healthy';
    } else {
      return 'Underweight';
    }
  }

  String interpretation() {
    if (_bmi > 30) {
      return 'You are fat ma dude need to do some exercise pretty please';
    } else if (_bmi > 18.5) {
      return 'You are at a normal weight. A very healthy boi';
    } else {
      return 'You should eat a bit more. Keep it up';
    }
  }
}
