class Playermodal {
  String? status;
  List<Players>? players;

  Playermodal({this.status, this.players});

  Playermodal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Players {
  String? uid;
  String? role;
  String? clubId;
  String? name;
  String? email;
  String? password;
  String? forgotPassKey;
  String? activeStatus;
  String? createdAt;
  String? clubName;

  Players(
      {this.uid,
      this.role,
      this.clubId,
      this.name,
      this.email,
      this.password,
      this.forgotPassKey,
      this.activeStatus,
      this.createdAt,
      this.clubName});

  Players.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    role = json['role'];
    clubId = json['club_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    forgotPassKey = json['forgot_pass_key'];
    activeStatus = json['active_status'];
    createdAt = json['created_at'];
    clubName = json['club_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['role'] = this.role;
    data['club_id'] = this.clubId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['forgot_pass_key'] = this.forgotPassKey;
    data['active_status'] = this.activeStatus;
    data['created_at'] = this.createdAt;
    data['club_name'] = this.clubName;
    return data;
  }
}
