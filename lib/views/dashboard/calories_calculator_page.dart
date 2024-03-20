import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/core_controller.dart';

class CaloriesCalculatorPage extends StatefulWidget {
  @override
  _CaloriesCalculatorPageState createState() => _CaloriesCalculatorPageState();
}

class _CaloriesCalculatorPageState extends State<CaloriesCalculatorPage> {
  double _weight = 0;
  double _height = 0;
  int _age = 0;
  String _gender = 'male';
  String caloriesApproximation = '';
  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    final coreController = Get.find<CoreController>();
    if (coreController.currentUser.value != null) {
      setState(() {
        _weight = double.tryParse(
                coreController.currentUser.value!.memberWeight ?? '0') ??
            0;
        _height = double.tryParse(
                coreController.currentUser.value!.memberHeight ?? '0') ??
            0;
      });
    }
  }

  double _calculateCalories() {
    if (_gender == 'male') {
      return (10 * _weight + 6.25 * _height - 5 * _age + 5) * 1.55;
    } else {
      return (10 * _weight + 6.25 * _height - 5 * _age - 161) * 1.55;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calories Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
              initialValue: _weight.toString(),
              onChanged: (value) => _weight = double.parse(value),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Height (cm)'),
              keyboardType: TextInputType.number,
              initialValue: _height.toString(),
              onChanged: (value) => _height = double.parse(value),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
              onChanged: (value) => _age = int.parse(value),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Gender'),
              value: _gender,
              onChanged: (String? newValue) {
                setState(() {
                  _gender = newValue!;
                });
              },
              items: <String>['male', 'female']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final calories = _calculateCalories();
                final roundedCalories = calories
                    .round(); // Round the calories to the nearest whole number
                setState(() {
                  caloriesApproximation =
                      'Your daily caloric needs are approximately $roundedCalories calories.';
                });
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(
                height: 16), // Add some space between the button and the text
            Container(
              padding: const EdgeInsets.all(
                  8.0), // Add some padding inside the container
              decoration: BoxDecoration(
                color: const Color.fromRGBO(
                    245, 245, 245, 0.8), // Smokey white color
                borderRadius:
                    BorderRadius.circular(8.0), // Optional: Add rounded corners
              ),
              child: Text(
                caloriesApproximation,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors
                        .black), // Ensure the text is readable against the background
              ),
            )

            // Text(
            //   caloriesApproximation,
            //   style: Theme.of(context).textTheme.headlineSmall,
            // ), // Display the calories approximation
          ],
        ),
      ),
    );
  }
}
