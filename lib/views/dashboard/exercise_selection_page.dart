// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import '../../controller/dashboard/exercise_controller.dart'; // Adjust the import path as necessary

// class ExerciseSelectionPage extends StatelessWidget {
//   final ExerciseSelectionController controller =
//       Get.put(ExerciseSelectionController());

//   ExerciseSelectionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Exercise Selection'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DropdownButton<String>(
//               value: controller.exerciseType.value,
//               onChanged: (String? newValue) {
//                 controller.updateExerciseType(newValue!);
//               },
//               items: <String>[
//                 'Strength',
//                 'Plyometrics',
//                 'Cardio',
//                 'Stretching',
//                 'Powerlifting',
//                 'Strongman',
//                 'Olympic Weightlifting'
//               ].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             DropdownButton<String>(
//               value: controller.exerciseLevel.value,
//               onChanged: (String? newValue) {
//                 controller.updateExerciseLevel(newValue!);
//               },
//               items: <String>['Intermediate', 'Beginner', 'Expert']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             TextField(
//               controller: TextEditingController(
//                   text: controller.numberOfExercises.value.toString()),
//               keyboardType: TextInputType.number, // Set keyboard type to number
//               inputFormatters: [
//                 FilteringTextInputFormatter
//                     .digitsOnly, // Ensure only digits are entered
//               ],
//               decoration: const InputDecoration(
//                 labelText: 'Number of Exercises',
//               ),
//               onChanged: (value) {
//                 // Check if the value is not empty before parsing it to an integer
//                 if (value.isNotEmpty) {
//                   controller.numberOfExercises.value = int.parse(value);
//                 } else {
//                   // If the value is empty, reset the numberOfExercises to a default value or 0
//                   controller.numberOfExercises.value =
//                       0; // or any default value you prefer
//                 }
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 controller.onSubmit();
//               },
//               child: const Text('Get Exercise Recommendations'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/widgets/custom/custom_elevated_button.dart';
import 'package:get/get.dart';

import '../../controller/dashboard/exercise_controller.dart';

class ExerciseSelectionPage extends StatelessWidget {
  final ExerciseSelectionController controller =
      Get.put(ExerciseSelectionController());

  ExerciseSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Category Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  value: controller.exerciseType.value,
                  onChanged: (String? newValue) {
                    controller.updateExerciseType(newValue!);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Exercise Type',
                  ),
                  items: <String>[
                    'Strength',
                    'Plyometrics',
                    'Cardio',
                    'Stretching',
                    'Powerlifting',
                    'Strongman',
                    'Olympic Weightlifting'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  value: controller.exerciseLevel.value,
                  onChanged: (String? newValue) {
                    controller.updateExerciseLevel(newValue!);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Exercise Level',
                  ),
                  items: <String>['Intermediate', 'Beginner', 'Expert']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: TextEditingController(
                      text: controller.numberOfExercises.value.toString()),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Number of Exercises',
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      controller.numberOfExercises.value = int.parse(value);
                    } else {
                      controller.numberOfExercises.value = 0;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            CustomElevatedButton(
              onTap: () {
                controller.onSubmit();
              },
              title: 'Get Exercise Recommendations',
            ),
          ],
        ),
      ),
    );
  }
}
