// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controller/core_controller.dart';

// class CaloriesCalculatorPage extends StatefulWidget {
//   const CaloriesCalculatorPage({super.key});

//   @override
//   _CaloriesCalculatorPageState createState() => _CaloriesCalculatorPageState();
// }

// class _CaloriesCalculatorPageState extends State<CaloriesCalculatorPage> {
//   double _weight = 0.0; // Changed to double
//   double _height = 0.0; // Changed to double
//   double _age = 0.0; // Changed to double

//   String _gender = 'male';
//   String caloriesApproximation = '';

//   @override
//   void initState() {
//     super.initState();
//     _loadUserDetails();
//   }

//   Future<void> _loadUserDetails() async {
//     final coreController = Get.find<CoreController>();
//     if (coreController.currentUser.value != null) {
//       setState(() {
//         _weight =
//             double.parse(coreController.currentUser.value!.memberWeight ?? '0');
//         _height =
//             double.parse(coreController.currentUser.value!.memberHeight ?? '0');
//       });
//     }
//   }

//   double _calculateCalories() {
//     if (_gender == 'male') {
//       return (10 * _weight + 6.25 * _height - 5 * _age + 5) * 1.55;
//     } else {
//       return (10 * _weight + 6.25 * _height - 5 * _age - 161) * 1.55;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Calories Calculator'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               decoration: const InputDecoration(labelText: 'Weight (kg)'),
//               keyboardType: TextInputType.number,
//               initialValue: _weight.toString(),
//               onChanged: (value) {
//                 if (value.isNotEmpty) {
//                   try {
//                     _weight = double.parse(value);
//                   } catch (e) {
//                     // Handle the error, e.g., show an error message or set _weight to a default value
//                     _weight = 0.0; // Default value
//                   }
//                 } else {
//                   _weight = 0.0; // Default value for empty string
//                 }
//               },
//             ),
//             TextFormField(
//               decoration: const InputDecoration(labelText: 'Height (cm)'),
//               keyboardType: TextInputType.number,
//               initialValue: _height.toString(),
//               onChanged: (value) {
//                 if (value.isNotEmpty) {
//                   try {
//                     _height = double.parse(value);
//                   } catch (e) {
//                     // Handle the error, e.g., show an error message or set _height to a default value
//                     _height = 0.0; // Default value
//                   }
//                 } else {
//                   _height = 0.0; // Default value for empty string
//                 }
//               },
//             ),
//             TextFormField(
//               decoration: const InputDecoration(labelText: 'Age'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 if (value.isNotEmpty) {
//                   try {
//                     _age = double.parse(value);
//                   } catch (e) {
//                     // Handle the error, e.g., show an error message or set _age to a default value
//                     _age = 0.0; // Default value
//                   }
//                 } else {
//                   _age = 0.0; // Default value for empty string
//                 }
//               },
//             ),
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Gender'),
//               value: _gender,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _gender = newValue!;
//                 });
//               },
//               items: <String>['male', 'female']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final calories = _calculateCalories();
//                 final roundedCalories = calories.round();
//                 setState(() {
//                   caloriesApproximation =
//                       'Your daily caloric needs are approximately $roundedCalories calories.';
//                 });
//               },
//               child: const Text('Calculate'),
//             ),
//             const SizedBox(height: 16),
//             Container(
//               padding: const EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 color: const Color.fromRGBO(245, 245, 245, 0.8),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Text(
//                 caloriesApproximation,
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge
//                     ?.copyWith(color: Colors.black),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/core_controller.dart';

class CaloriesCalculatorPage extends StatefulWidget {
  const CaloriesCalculatorPage({super.key});

  @override
  _CaloriesCalculatorPageState createState() => _CaloriesCalculatorPageState();
}

class _CaloriesCalculatorPageState extends State<CaloriesCalculatorPage> {
  double _weight = 0.0;
  double _height = 0.0;
  double _age = 0.0;

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
        _weight =
            double.parse(coreController.currentUser.value!.memberWeight ?? '0');
        _height =
            double.parse(coreController.currentUser.value!.memberHeight ?? '0');
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
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Weight (kg)',
                        prefixIcon: Icon(Icons.monitor_weight),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: _weight.toString(),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          try {
                            _weight = double.parse(value);
                          } catch (e) {
                            _weight = 0.0;
                          }
                        } else {
                          _weight = 0.0;
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Height (cm)',
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: _height.toString(),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          try {
                            _height = double.parse(value);
                          } catch (e) {
                            _height = 0.0;
                          }
                        } else {
                          _height = 0.0;
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        prefixIcon: Icon(Icons.cake),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          try {
                            _age = double.parse(value);
                          } catch (e) {
                            _age = 0.0;
                          }
                        } else {
                          _age = 0.0;
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Gender',
                        prefixIcon: Icon(Icons.person),
                      ),
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                final calories = _calculateCalories();
                final roundedCalories = calories.round();
                setState(() {
                  caloriesApproximation =
                      'Your daily caloric needs are approximately $roundedCalories calories.';
                });
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 24.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                caloriesApproximation,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
