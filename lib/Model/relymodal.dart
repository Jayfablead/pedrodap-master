class ReplyModal {
  String? status;
  int? totalReplies;
  List<TrainningAndNoteReplies>? trainningAndNoteReplies;

  ReplyModal({this.status, this.totalReplies, this.trainningAndNoteReplies});

  ReplyModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalReplies = json['total_replies'];
    if (json['trainning_and_note_replies'] != null) {
      trainningAndNoteReplies = <TrainningAndNoteReplies>[];
      json['trainning_and_note_replies'].forEach((v) {
        trainningAndNoteReplies!.add(new TrainningAndNoteReplies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_replies'] = this.totalReplies;
    if (this.trainningAndNoteReplies != null) {
      data['trainning_and_note_replies'] =
          this.trainningAndNoteReplies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrainningAndNoteReplies {
  String? date;
  String? time;
  String? reply;

  TrainningAndNoteReplies({this.date, this.time, this.reply});

  TrainningAndNoteReplies.fromJson(Map<String, dynamic> json) {
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
