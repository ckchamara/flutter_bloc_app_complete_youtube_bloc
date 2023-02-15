class ExerciseModel {
  String? title;
  int? prelude;
  int? duration;
  int? index;

  ExerciseModel({this.title, this.prelude, this.duration, this.index});

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    prelude = json['prelude'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['prelude'] = this.prelude;
    data['duration'] = this.duration;
    return data;
  }
}