class FitreplyModal {
  String? status;
  List<FitnessProgrammeReplies>? fitnessProgrammeReplies;

  FitreplyModal({this.status, this.fitnessProgrammeReplies});

  FitreplyModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['fitness_programme_replies'] != null) {
      fitnessProgrammeReplies = <FitnessProgrammeReplies>[];
      json['fitness_programme_replies'].forEach((v) {
        fitnessProgrammeReplies!.add(new FitnessProgrammeReplies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.fitnessProgrammeReplies != null) {
      data['fitness_programme_replies'] =
          this.fitnessProgrammeReplies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FitnessProgrammeReplies {
  String? date;
  String? time;
  String? reply;

  FitnessProgrammeReplies({this.date, this.time, this.reply});

  FitnessProgrammeReplies.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['reply'] = this.reply;
    return data;
  }
}
