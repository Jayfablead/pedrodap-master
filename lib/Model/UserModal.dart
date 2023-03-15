class UserModal {
  String? status;
  UserData? userData;

  UserModal({this.status, this.userData});

  UserModal.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? uid;
  String? role;
  String? clubId;
  String? name;
  String? email;
  String? password;
  String? viewPassword;
  String? forgotPassKey;
  String? activeStatus;
  String? createdAt;
  String? clubName;
  int? age;

  UserData(
      {this.uid,
      this.role,
      this.clubId,
      this.name,
      this.email,
      this.password,
      this.viewPassword,
      this.forgotPassKey,
      this.activeStatus,
      this.createdAt,
      this.clubName,
      this.age});

  UserData.fromJson(Map<dynamic, dynamic> json) {
    uid = json['uid'];
    role = json['role'];
    clubId = json['club_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    viewPassword = json['view_password'];
    forgotPassKey = json['forgot_pass_key'];
    activeStatus = json['active_status'];
    createdAt = json['created_at'];
    clubName = json['club_name'];
    age = json['age'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['uid'] = this.uid;
    data['role'] = this.role;
    data['club_id'] = this.clubId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['view_password'] = this.viewPassword;
    data['forgot_pass_key'] = this.forgotPassKey;
    data['active_status'] = this.activeStatus;
    data['created_at'] = this.createdAt;
    data['club_name'] = this.clubName;
    data['age'] = this.age;
    return data;
  }
}
