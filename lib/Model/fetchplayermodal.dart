class Fetchplayermodal {
  String? status;
  Players? players;

  Fetchplayermodal({this.status, this.players});

  Fetchplayermodal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    players =
        json['players'] != null ? new Players.fromJson(json['players']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.players != null) {
      data['players'] = this.players!.toJson();
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
  String? id;
  String? phone;
  String? address;
  Null? profilePic;
  Null? availability;
  Null? experience;
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
      this.id,
      this.phone,
      this.address,
      this.profilePic,
      this.availability,
      this.experience,
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
    id = json['id'];
    phone = json['phone'];
    address = json['address'];
    profilePic = json['profile_pic'];
    availability = json['availability'];
    experience = json['experience'];
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
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['profile_pic'] = this.profilePic;
    data['availability'] = this.availability;
    data['experience'] = this.experience;
    data['club_name'] = this.clubName;
    return data;
  }
}
