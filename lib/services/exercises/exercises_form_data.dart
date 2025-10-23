

class ExercisesFormData {
  String? titleExercise;
  String? descriptionExercise;
  String? titleStep;
  String? descriptionStep;
  List<Map<String, String>> stepsExercise = [];
  String? videoUrl;
  int? durationVideo;

  

  void addStep({required String titleStep, required String descriptionStep}) {
    stepsExercise.addAll([
      {titleStep: descriptionStep}
    ]);
    print(stepsExercise);
  }
}
