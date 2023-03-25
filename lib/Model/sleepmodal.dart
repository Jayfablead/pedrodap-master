class SleepModal {
  String? status;
  List<SleepScheduleDetails>? sleepScheduleDetails;

  SleepModal({this.status, this.sleepScheduleDetails});

  SleepModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sleep_schedule_details'] != null) {
      sleepScheduleDetails = <SleepScheduleDetails>[];
      json['sleep_schedule_details'].forEach((v) {
        sleepScheduleDetails!.add(new SleepScheduleDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.sleepScheduleDetails != null) {
      data['sleep_schedule_details'] =
          this.sleepScheduleDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SleepScheduleDetails {
  String? id;
  String? playerId;
  String? date;
  String? time;
  String? noteTitle;
  String? note;
  String? reminders;
  String? createdAt;

  SleepScheduleDetails(
      {this.id,
      this.playerId,
      this.date,
      this.time,
      this.noteTitle,
      this.note,
      this.reminders,
      this.createdAt});

  SleepScheduleDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    date = json['date'];
    time = json['time'];
    noteTitle = json['note_title'];
    note = json['note'];
    reminders = json['reminders'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_id'] = this.playerId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['note_title'] = this.noteTitle;
    data['note'] = this.note;
    data['reminders'] = this.reminders;
    data['created_at'] = this.createdAt;
    return data;
  }
}
