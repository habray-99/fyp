// // import 'package:flutter/material.dart';
// // import '../../model/exercises.dart';

// // class ExerciseRecommendationPage extends StatelessWidget {
// //   final List<ExerciseRecommendations> recommendations;

// //   const ExerciseRecommendationPage({super.key, required this.recommendations});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Exercise Recommendations'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: recommendations.length,
// //         itemBuilder: (context, index) {
// //           final recommendation = recommendations[index];
// //           return ListTile(
// //             title: Text(recommendation.title ?? ''),
// //             subtitle: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text("Exercise description: ${recommendation.desc ?? ''}"),
// //                 Text("Exercise body part: ${recommendation.bodyPart ?? ''}"),
// //                 Text("Exercise equipment: ${recommendation.equipment ?? ''}"),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import '../../model/exercises.dart';

// class ExerciseRecommendationPage extends StatelessWidget {
//   final List<ExerciseRecommendations> recommendations;

//   const ExerciseRecommendationPage({super.key, required this.recommendations});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Exercise Recommendations'),
//       ),
//       body: ListView.builder(
//         itemCount: recommendations.length,
//         itemBuilder: (context, index) {
//           final recommendation = recommendations[index];
//           return ExpansionTile(
//             expandedCrossAxisAlignment: CrossAxisAlignment.start,
//             title: Text(recommendation.title ?? ''),
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Text(
//                   "Exercise description: ${recommendation.desc == '' ? 'Currently not Available' : recommendation.desc}",
//                   // style: const TextStyle()
//                   textAlign: TextAlign.justify,
//                   style: const TextStyle(overflow: TextOverflow.ellipsis),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Text(
//                   "Exercise body part: ${recommendation.bodyPart == '' ? 'Currently not Available' : recommendation.bodyPart}",
//                   // style: const TextStyle(fontSize: 16),
//                   textAlign: TextAlign.justify,
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Text(
//                   "Exercise equipment: ${recommendation.equipment == '' ? 'Currently not Available' : recommendation.equipment}",
//                   // style: const TextStyle(fontSize: 16),
//                   textAlign: TextAlign.justify,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../model/exercises.dart';

class ExerciseRecommendationPage extends StatelessWidget {
  final List<ExerciseRecommendations> recommendations;

  const ExerciseRecommendationPage({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Recommendations'),
      ),
      body: ListView.builder(
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final recommendation = recommendations[index];
          return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ExpansionTile(
              initiallyExpanded: index == 0,
              title: Text(recommendation.title ?? ''),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Exercise description: ${recommendation.desc == '' ? 'Currently not Available' : recommendation.desc}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Exercise body part: ${recommendation.bodyPart == '' ? 'Currently not Available' : recommendation.bodyPart}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Exercise equipment: ${recommendation.equipment == '' ? 'Currently not Available' : recommendation.equipment}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
