class searchUsersModal {
  String? status;
  List<AllUsers>? allUsers;

  searchUsersModal({this.status, this.allUsers});

  searchUsersModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['all_users'] != null) {
      allUsers = <AllUsers>[];
      json['all_users'].forEach((v) {
        allUsers!.add(new AllUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allUsers != null) {
      data['all_users'] = this.allUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllUsers {
  String? uid;
  String? role;
  Null? clubName;
  String? name;
  String? email;
  String? createdAt;
  int? connections;
  String? profilePic;
  String? position;

  AllUsers(
      {this.uid,
        this.role,
        this.clubName,
        this.name,
        this.email,
        this.createdAt,
        this.connections,
        this.profilePic,
        this.position});

  AllUsers.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    role = json['role'];
    clubName = json['club_name'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    connections = json['connections'];
    profilePic = json['profile_pic'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['role'] = this.role;
    data['club_name'] = this.clubName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['connections'] = this.connections;
    data['profile_pic'] = this.profilePic;
    data['position'] = this.position;
    return data;
  }
}