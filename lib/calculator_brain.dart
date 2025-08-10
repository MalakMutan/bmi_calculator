import 'dart:math';
import 'input_page.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  final Gender gender;

  double _bmi = 0;

  CalculatorBrain({
    required this.height,
    required this.weight,
    required this.gender,
  });

  String calculateBMI() {
    double heightInMeters = height / 100;
    _bmi = weight / pow(heightInMeters, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return gender == Gender.female
          ? 'You have a higher than normal body weight. Consider a healthy diet and regular walks.'
          : 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return gender == Gender.female
          ? 'You have a healthy body weight. Keep it up!'
          : 'You have a normal body weight. Good job!';
    } else {
      return gender == Gender.female
          ? 'You have a lower than normal body weight. Make sure you are eating enough.'
          : 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
