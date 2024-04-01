import 'dart:convert';

// List<ExerciseRecommendations> exerciseRecommendationsFromJson(String str) => List<ExerciseRecommendations>.from(json.decode(str).map((x) => ExerciseRecommendations.fromJson(x)));
// List<ExerciseRecommendations> exerciseRecommendationsFromJson(
//         List<dynamic> json) =>
//     List<ExerciseRecommendations>.from(
//         json.map((x) => ExerciseRecommendations.fromJson(x)));

String exerciseRecommendationsToJson(List<ExerciseRecommendations> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<ExerciseRecommendations> exerciseRecommendationsListFromJson(List<dynamic> exerciseRecommendationsListJson) =>
    exerciseRecommendationsListJson
        .map((exerciseRecommendationJson) =>
            ExerciseRecommendations.fromJson(exerciseRecommendationJson as Map<String, dynamic>))
        .toList();


class ExerciseRecommendations {
  final String? title;
  final String? desc;
  final String? bodyPart;
  final String? equipment;

  ExerciseRecommendations({
    this.title,
    this.desc,
    this.bodyPart,
    this.equipment,
  });

  factory ExerciseRecommendations.fromJson(Map<String, dynamic> json) =>
      ExerciseRecommendations(
        title: json["title"],
        desc: json["desc"],
        bodyPart: json["body_part"],
        equipment: json["equipment"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
        "body_part": bodyPart,
        "equipment": equipment,
      };
}
