class FitnessModal {
  String? status;
  List<AllFitnessProgrammesDetails>? allFitnessProgrammesDetails;

  FitnessModal({this.status, this.allFitnessProgrammesDetails});

  FitnessModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['all_fitness_programmes_details'] != null) {
      allFitnessProgrammesDetails = <AllFitnessProgrammesDetails>[];
      json['all_fitness_programmes_details'].forEach((v) {
        allFitnessProgrammesDetails!
            .add(new AllFitnessProgrammesDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allFitnessProgrammesDetails != null) {
      data['all_fitness_programmes_details'] =
          this.allFitnessProgrammesDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllFitnessProgrammesDetails {
  String? id;
  String? playerId;
  String? taskName;
  String? taskDesc;
  String? file;
  String? priority;
  String? complete;
  String? createdAt;
  String? playerName;
  String? time;

  AllFitnessProgrammesDetails(
      {this.id,
      this.playerId,
      this.taskName,
      this.taskDesc,
      this.file,
      this.priority,
      this.complete,
      this.createdAt,
      this.playerName,
      this.time});

  AllFitnessProgrammesDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    taskName = json['task_name'];
    taskDesc = json['task_desc'];
    file = json['file'];
    priority = json['priority'];
    complete = json['complete'];
    createdAt = json['created_at'];
    playerName = json['player_name'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_id'] = this.playerId;
    data['task_name'] = this.taskName;
    data['task_desc'] = this.taskDesc;
    data['file'] = this.file;
    data['priority'] = this.priority;
    data['complete'] = this.complete;
    data['created_at'] = this.createdAt;
    data['player_name'] = this.playerName;
    data['time'] = this.time;
    return data;
  }
}
