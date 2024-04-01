import 'package:fyp/utils/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../repo/get_recommendation_repo.dart';
import '../../views/dashboard/exercise_recommendation_page.dart';

// Adjust the import path as necessary

class ExerciseSelectionController extends GetxController {
  var exerciseType = 'Strength'.obs;
  var exerciseLevel = 'Intermediate'.obs;
  var numberOfExercises = 15.obs;

  void updateExerciseType(String value) {
    exerciseType.value = value;
  }

  void updateExerciseLevel(String value) {
    exerciseLevel.value = value;
  }
  void updatenumberOfExercises(int value) {
    numberOfExercises.value = value;
  }

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  void onSubmit() async {
    loading.show(
      message: 'Please wait',
      hideText: true,
    );
    GetRecommendationsRepo.getRecommendations(
      exercisesType: exerciseType.value,
      exercisesLevel: exerciseLevel.value,
      numberOfExercises: numberOfExercises.value,
      onSuccess: (recommendations) {
        loading.hide();
        Get.to(() => ExerciseRecommendationPage(
              recommendations: recommendations,
            ));
      },
      onError: (message) {
        loading.hide();
        CustomSnackBar.error(title: "Recommendation", message: message);
      },
    );
  }
}
