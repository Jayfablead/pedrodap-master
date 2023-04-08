class SearchchatModal {
  String? status;
  List<MessagesData>? messagesData;

  SearchchatModal({this.status, this.messagesData});

  SearchchatModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['messages_data'] != null) {
      messagesData = <MessagesData>[];
      json['messages_data'].forEach((v) {
        messagesData!.add(new MessagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.messagesData != null) {
      data['messages_data'] =
          this.messagesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessagesData {
  String? mid;
  String? from;
  String? to;
  String? readStatus;
  String? createdAt;
  String? type;
  String? message;
  String? uid;
  String? name;
  String? profilePic;
  String? time;

  MessagesData(
      {this.mid,
        this.from,
        this.to,
        this.readStatus,
        this.createdAt,
        this.type,
        this.message,
        this.uid,
        this.name,
        this.profilePic,
        this.time});

  MessagesData.fromJson(Map<String, dynamic> json) {
    mid = json['mid'];
    from = json['from'];
    to = json['to'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
    type = json['type'];
    message = json['message'];
    uid = json['uid'];
    name = json['name'];
    profilePic = json['profile_pic'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mid'] = this.mid;
    data['from'] = this.from;
    data['to'] = this.to;
    data['read_status'] = this.readStatus;
    data['created_at'] = this.createdAt;
    data['type'] = this.type;
    data['message'] = this.message;
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['profile_pic'] = this.profilePic;
    data['time'] = this.time;
    return data;
  }
}
