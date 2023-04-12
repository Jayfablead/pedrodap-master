class ReqModal {
  String? status;
  List<AllRequestedUsers>? allRequestedUsers;

  ReqModal({this.status, this.allRequestedUsers});

  ReqModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['all_requested_users'] != null) {
      allRequestedUsers = <AllRequestedUsers>[];
      json['all_requested_users'].forEach((v) {
        allRequestedUsers!.add(new AllRequestedUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.allRequestedUsers != null) {
      data['all_requested_users'] =
          this.allRequestedUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllRequestedUsers {
  String? uid;
  String? name;
  String? profilePic;

  AllRequestedUsers({this.uid, this.name, this.profilePic});

  AllRequestedUsers.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}