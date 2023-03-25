class ViewtodoModal {
  String? status;
  int? totalTodos;
  List<TrainningAndNoteTodos>? trainningAndNoteTodos;

  ViewtodoModal({this.status, this.totalTodos, this.trainningAndNoteTodos});

  ViewtodoModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalTodos = json['total_todos'];
    if (json['trainning_and_note_todos'] != null) {
      trainningAndNoteTodos = <TrainningAndNoteTodos>[];
      json['trainning_and_note_todos'].forEach((v) {
        trainningAndNoteTodos!.add(new TrainningAndNoteTodos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_todos'] = this.totalTodos;
    if (this.trainningAndNoteTodos != null) {
      data['trainning_and_note_todos'] =
          this.trainningAndNoteTodos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrainningAndNoteTodos {
  String? date;
  String? time;
  String? title;
  String? toDoId;
  int? isComplete;

  TrainningAndNoteTodos(
      {this.date, this.time, this.title, this.toDoId, this.isComplete});

  TrainningAndNoteTodos.fromJson(Map<String, dynamic> json) {
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
