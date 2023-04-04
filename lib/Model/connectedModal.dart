class ConnectedModal {
  String? status;
  int? totalConnectedUser;
  List<ConnectedUsers>? connectedUsers;

  ConnectedModal({this.status, this.totalConnectedUser, this.connectedUsers});

  ConnectedModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalConnectedUser = json['total_connected_user'];
    if (json['connected_users'] != null) {
      connectedUsers = <ConnectedUsers>[];
      json['connected_users'].forEach((v) {
        connectedUsers!.add(new ConnectedUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_connected_user'] = this.totalConnectedUser;
    if (this.connectedUsers != null) {
      data['connected_users'] =
          this.connectedUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConnectedUsers {
  String? uid;
  String? name;
  String? profilePic;

  ConnectedUsers({this.uid, this.name, this.profilePic});

  ConnectedUsers.fromJson(Map<String, dynamic> json) {
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