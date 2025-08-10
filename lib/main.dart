import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
