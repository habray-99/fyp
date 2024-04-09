import 'dart:convert';
import 'dart:developer';

import 'package:fyp/utils/apis.dart';
import 'package:http/http.dart' as http;

import '../model/exercises.dart';

class GetRecommendationsRepo {
  static Future<void> getRecommendations({
    required String exercisesType,
    required String exercisesLevel,
    required int numberOfExercises,
    required Function(List<ExerciseRecommendations> exerciseRecommendation)
        onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var header = {
        "Accept": "application/json",
      };

      // Construct the URL with query parameters
      var url = Uri.parse(Apis.getRecommendations).replace(queryParameters: {
        'type': exercisesType,
        'level': exercisesLevel,
        'numberOfExercises': numberOfExercises.toString(),
      });

      log(url.toString());

      var response = await http.get(
        url,
        headers: header,
      );
      // var response = await HttpRequest.get(url, headers: header);
      print("Response: ");
      // log(response.toString());
      dynamic data = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<ExerciseRecommendations> recommendations =
            exerciseRecommendationsListFromJson(data["exercises"]);
        onSuccess(recommendations);
      } else {
        onError(data["message"].toString());
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Something went wrong.");
    }
  }
}
