class FeedImagesModal {
  String? message;
  String? status;
  List<AllImgPosts>? allImgPosts;

  FeedImagesModal({this.message, this.status, this.allImgPosts});

  FeedImagesModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['all_img_posts'] != null) {
      allImgPosts = <AllImgPosts>[];
      json['all_img_posts'].forEach((v) {
        allImgPosts!.add(new AllImgPosts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.allImgPosts != null) {
      data['all_img_posts'] = this.allImgPosts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllImgPosts {
  String? playerName;
  Null? clubName;
  String? imageUrl;
  String? imageCaption;

  AllImgPosts(
      {this.playerName, this.clubName, this.imageUrl, this.imageCaption});

  AllImgPosts.fromJson(Map<String, dynamic> json) {
    playerName = json['player_name'];
    clubName = json['club_name'];
    imageUrl = json['image_url'];
    imageCaption = json['image_caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_name'] = this.playerName;
    data['club_name'] = this.clubName;
    data['image_url'] = this.imageUrl;
    data['image_caption'] = this.imageCaption;
    return data;
  }
}