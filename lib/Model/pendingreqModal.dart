class PendingreqModal {
  String? status;
  List<PendingRequests>? pendingRequests;

  PendingreqModal({this.status, this.pendingRequests});

  PendingreqModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['pending_requests'] != null) {
      pendingRequests = <PendingRequests>[];
      json['pending_requests'].forEach((v) {
        pendingRequests!.add(new PendingRequests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.pendingRequests != null) {
      data['pending_requests'] =
          this.pendingRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PendingRequests {
  String? uid;
  String? name;
  String? profilePic;

  PendingRequests({this.uid, this.name, this.profilePic});

  PendingRequests.fromJson(Map<String, dynamic> json) {
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