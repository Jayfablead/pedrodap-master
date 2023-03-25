class NutritionModal {
  String? status;
  List<AllNutritionAndHealthDetails>? allNutritionAndHealthDetails;

  NutritionModal({this.status, this.allNutritionAndHealthDetails});

  NutritionModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['all_nutrition_and_health_details'] != null) {
      allNutritionAndHealthDetails = <AllNutritionAndHealthDetails>[];
      json['all_nutrition_and_health_details'].forEach((v) {
        allNutritionAndHealthDetails!
            .add(new AllNutritionAndHealthDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allNutritionAndHealthDetails != null) {
      data['all_nutrition_and_health_details'] =
          this.allNutritionAndHealthDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllNutritionAndHealthDetails {
  String? id;
  String? playerId;
  String? taskType;
  String? taskTitle;
  String? taskDesc;
  String? file;
  String? date;
  String? priority;
  String? complete;
  String? createdAt;
  String? playerName;
  String? time;

  AllNutritionAndHealthDetails(
      {this.id,
      this.playerId,
      this.taskType,
      this.taskTitle,
      this.taskDesc,
      this.file,
      this.date,
      this.priority,
      this.complete,
      this.createdAt,
      this.playerName,
      this.time});

  AllNutritionAndHealthDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    taskType = json['task_type'];
    taskTitle = json['task_title'];
    taskDesc = json['task_desc'];
    file = json['file'];
    date = json['date'];
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
    data['task_type'] = this.taskType;
    data['task_title'] = this.taskTitle;
    data['task_desc'] = this.taskDesc;
    data['file'] = this.file;
    data['date'] = this.date;
    data['priority'] = this.priority;
    data['complete'] = this.complete;
    data['created_at'] = this.createdAt;
    data['player_name'] = this.playerName;
    data['time'] = this.time;
    return data;
  }
}
