class SearchfitModal {
  String? status;
  List<AllFitnessProgrammeSearch>? allFitnessProgrammeSearch;

  SearchfitModal({this.status, this.allFitnessProgrammeSearch});

  SearchfitModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['all_fitness_programme_search'] != null) {
      allFitnessProgrammeSearch = <AllFitnessProgrammeSearch>[];
      json['all_fitness_programme_search'].forEach((v) {
        allFitnessProgrammeSearch!
            .add(new AllFitnessProgrammeSearch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allFitnessProgrammeSearch != null) {
      data['all_fitness_programme_search'] =
          this.allFitnessProgrammeSearch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllFitnessProgrammeSearch {
  String? id;
  String? playerId;
  String? playerName;
  String? title;
  Null? noteFile;
  String? description;
  int? isCompleted;
  String? time;
  String? createdAt;

  AllFitnessProgrammeSearch(
      {this.id,
        this.playerId,
        this.playerName,
        this.title,
        this.noteFile,
        this.description,
        this.isCompleted,
        this.time,
        this.createdAt});

  AllFitnessProgrammeSearch.fromJson(Map<String, dynamic> json) {
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