class SearchtrainModal {
  String? status;
  List<AllTrainingsAndNotes>? allTrainingsAndNotes;

  SearchtrainModal({this.status, this.allTrainingsAndNotes});

  SearchtrainModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['all_trainings_and_notes'] != null) {
      allTrainingsAndNotes = <AllTrainingsAndNotes>[];
      json['all_trainings_and_notes'].forEach((v) {
        allTrainingsAndNotes!.add(new AllTrainingsAndNotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allTrainingsAndNotes != null) {
      data['all_trainings_and_notes'] =
          this.allTrainingsAndNotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllTrainingsAndNotes {
  String? id;
  String? playerId;
  String? playerName;
  String? title;
  String? noteFile;
  String? description;
  int? isCompleted;
  String? time;
  String? createdAt;

  AllTrainingsAndNotes(
      {this.id,
      this.playerId,
      this.playerName,
      this.title,
      this.noteFile,
      this.description,
      this.isCompleted,
      this.time,
      this.createdAt});

  AllTrainingsAndNotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    playerName = json['player_name'];
    title = json['title'];
    noteFile = json['note_file'];
    description = json['description'];
    isCompleted = json['is_completed'];
    time = json['time'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_id'] = this.playerId;
    data['player_name'] = this.playerName;
    data['title'] = this.title;
    data['note_file'] = this.noteFile;
    data['description'] = this.description;
    data['is_completed'] = this.isCompleted;
    data['time'] = this.time;
    data['created_at'] = this.createdAt;
    return data;
  }
}
