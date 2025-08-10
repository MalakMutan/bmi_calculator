import 'package:flutter/material.dart';
import 'calculator_brain.dart';
import 'results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              genderCard(Gender.male, Icons.male, 'MALE'),
              genderCard(Gender.female, Icons.female, 'FEMALE'),
            ],
          ),
          SizedBox(height: 20),
          Text('Height: $height cm'),
          Slider(
            value: height.toDouble(),
            min: 100,
            max: 220,
            onChanged: (newValue) {
              setState(() {
                height = newValue.round();
              });
            },
          ),
          SizedBox(height: 20),
          Text('Weight: $weight kg'),
          Slider(
            value: weight.toDouble(),
            min: 30,
            max: 150,
            onChanged: (newValue) {
              setState(() {
                weight = newValue.round();
              });
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            child: Text('Calculate BMI'),
            onPressed: () {
              if (selectedGender != null) {
                CalculatorBrain calc = CalculatorBrain(
                  height: height,
                  weight: weight,
                  gender: selectedGender!,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please select your gender')),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget genderCard(Gender gender, IconData icon, String label) {
    bool isSelected = selectedGender == gender;
    Color selectedColor =
    gender == Gender.male ? Colors.blueAccent : Colors.pinkAccent;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: selectedColor.withOpacity(0.4),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: isSelected ? Colors.white : Colors.black54,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black87,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
