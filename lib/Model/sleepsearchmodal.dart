class SleepsearchModal {
  String? status;
  List<SleepScheduleDetails>? sleepScheduleDetails;

  SleepsearchModal({this.status, this.sleepScheduleDetails});

  SleepsearchModal.fromJson(Map<String, dynamic> json) {
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
  bool? reminders;
  String? createTime;

  SleepScheduleDetails(
      {this.id,
        this.playerId,
        this.date,
        this.time,
        this.noteTitle,
        this.note,
        this.reminders,
        this.createTime});

  SleepScheduleDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    date = json['date'];
    time = json['time'];
    noteTitle = json['note_title'];
    note = json['note'];
    reminders = json['reminders'];
    createTime = json['create_time'];
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
    data['create_time'] = this.createTime;
    return data;
  }
}