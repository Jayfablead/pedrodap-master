class SearchNutModal {
  String? status;
  List<AllNutritionAndHealthSearch>? allNutritionAndHealthSearch;

  SearchNutModal({this.status, this.allNutritionAndHealthSearch});

  SearchNutModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['all_nutrition_and_health_search'] != null) {
      allNutritionAndHealthSearch = <AllNutritionAndHealthSearch>[];
      json['all_nutrition_and_health_search'].forEach((v) {
        allNutritionAndHealthSearch!
            .add(new AllNutritionAndHealthSearch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allNutritionAndHealthSearch != null) {
      data['all_nutrition_and_health_search'] =
          this.allNutritionAndHealthSearch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllNutritionAndHealthSearch {
  String? id;
  String? playerId;
  String? playerName;
  String? title;
  String? noteFile;
  String? description;
  int? isCompleted;
  String? time;
  String? createdAt;

  AllNutritionAndHealthSearch(
      {this.id,
        this.playerId,
        this.playerName,
        this.title,
        this.noteFile,
        this.description,
        this.isCompleted,
        this.time,
        this.createdAt});

  AllNutritionAndHealthSearch.fromJson(Map<String, dynamic> json) {
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