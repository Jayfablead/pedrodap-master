class FitalltodoModal {
  String? status;
  List<FitnessProgrammeTodos>? fitnessProgrammeTodos;

  FitalltodoModal({this.status, this.fitnessProgrammeTodos});

  FitalltodoModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['fitness_programme_todos'] != null) {
      fitnessProgrammeTodos = <FitnessProgrammeTodos>[];
      json['fitness_programme_todos'].forEach((v) {
        fitnessProgrammeTodos!.add(new FitnessProgrammeTodos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.fitnessProgrammeTodos != null) {
      data['fitness_programme_todos'] =
          this.fitnessProgrammeTodos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FitnessProgrammeTodos {
  String? date;
  String? time;
  String? title;
  String? toDoId;
  int? isComplete;

  FitnessProgrammeTodos(
      {this.date, this.time, this.title, this.toDoId, this.isComplete});

  FitnessProgrammeTodos.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    title = json['title'];
    toDoId = json['to_do_id'];
    isComplete = json['is_complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['title'] = this.title;
    data['to_do_id'] = this.toDoId;
    data['is_complete'] = this.isComplete;
    return data;
  }
}
