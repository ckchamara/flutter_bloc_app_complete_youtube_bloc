class ExerciseModel {
  String? title;
  int? prelude;
  int? duration;
  int? index;

  ExerciseModel({this.title, this.prelude, this.duration, this.index});

  factory ExerciseModel.fromJson(Map<String, dynamic> json, int index) {
    return ExerciseModel(
        title: json['title'],
        prelude: json['prelude'],
        duration: json['duration'],
        index: index);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['prelude'] = this.prelude;
    data['duration'] = this.duration;
    return data;
  }
}
