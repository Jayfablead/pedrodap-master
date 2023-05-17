class feedVidsModal {
  String? message;
  bool? status;
  List<AllVideosFetch>? allVideosFetch;

  feedVidsModal({this.message, this.status, this.allVideosFetch});

  feedVidsModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['all_videos_fetch'] != null) {
      allVideosFetch = <AllVideosFetch>[];
      json['all_videos_fetch'].forEach((v) {
        allVideosFetch!.add(new AllVideosFetch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.allVideosFetch != null) {
      data['all_videos_fetch'] =
          this.allVideosFetch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllVideosFetch {
  String? playerName;
  String? clubName;
  String? videoUrl;
  String? vidCaption;

  AllVideosFetch(
      {this.playerName, this.clubName, this.videoUrl, this.vidCaption});

  AllVideosFetch.fromJson(Map<String, dynamic> json) {
    playerName = json['player_name'];
    clubName = json['club_name'];
    videoUrl = json['video_url'];
    vidCaption = json['vid_caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_name'] = this.playerName;
    data['club_name'] = this.clubName;
    data['video_url'] = this.videoUrl;
    data['vid_caption'] = this.vidCaption;
    return data;
  }
}