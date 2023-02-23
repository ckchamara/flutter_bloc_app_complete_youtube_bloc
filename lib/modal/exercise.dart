class ExerciseModel {
  String title;
  int prelude;
  int duration;
  int index;
  int startTime;

  ExerciseModel({required this.title, required this.prelude, required this.duration, required this.index, required this.startTime});

  factory ExerciseModel.fromJson(Map<String, dynamic> json, int index, int startTime) {
    return ExerciseModel(
        title: json['title'],
        prelude: json['prelude'],
        duration: json['duration'],
        index: index, startTime: startTime);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['prelude'] = this.prelude;
    data['duration'] = this.duration;
    return data;
  }
}
