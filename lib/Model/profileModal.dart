class ProfileModal {
  String? status;
  ViewProfileDetails? viewProfileDetails;

  ProfileModal({this.status, this.viewProfileDetails});

  ProfileModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    viewProfileDetails = json['view_profile_details'] != null
        ? new ViewProfileDetails.fromJson(json['view_profile_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.viewProfileDetails != null) {
      data['view_profile_details'] = this.viewProfileDetails!.toJson();
    }
    return data;
  }
}

class ViewProfileDetails {
  String? name;
  String? clubId;
  String? email;
  String? role;
  String? uid;
  String? profilePic;
  String? phone;
  String? address;
  String? createdAt;
  String? age;
  String? about;
  String? experience;
  List<String>? images;
  List<String>? imgCaption;
  String? video;
  String? vidCaption;
  String? socialLink;
  String? occupation;
  String? position;
  String? previousClub;
  String? injuries;
  String? goals;
  int? messagesCount;
  String? currentClub;

  ViewProfileDetails(
      {this.name,
        this.clubId,
        this.email,
        this.role,
        this.uid,
        this.profilePic,
        this.phone,
        this.address,
        this.createdAt,
        this.age,
        this.about,
        this.experience,
        this.images,
        this.imgCaption,
        this.video,
        this.vidCaption,
        this.socialLink,
        this.occupation,
        this.position,
        this.previousClub,
        this.injuries,
        this.goals,
        this.messagesCount,
        this.currentClub});

  ViewProfileDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    clubId = json['club_id'];
    email = json['email'];
    role = json['role'];
    uid = json['uid'];
    profilePic = json['profile_pic'];
    phone = json['phone'];
    address = json['address'];
    createdAt = json['created_at'];
    age = json['age'];
    about = json['about'];
    experience = json['experience'];
    images = json['images'].cast<String>();
    imgCaption = json['img_caption'].cast<String>();
    video = json['video'];
    vidCaption = json['vid_caption'];
    socialLink = json['social_link'];
    occupation = json['occupation'];
    position = json['position'];
    previousClub = json['previous_club'];
    injuries = json['injuries'];
    goals = json['goals'];
    messagesCount = json['messages_count'];
    currentClub = json['current_club'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['club_id'] = this.clubId;
    data['email'] = this.email;
    data['role'] = this.role;
    data['uid'] = this.uid;
    data['profile_pic'] = this.profilePic;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['age'] = this.age;
    data['about'] = this.about;
    data['experience'] = this.experience;
    data['images'] = this.images;
    data['img_caption'] = this.imgCaption;
    data['video'] = this.video;
    data['vid_caption'] = this.vidCaption;
    data['social_link'] = this.socialLink;
    data['occupation'] = this.occupation;
    data['position'] = this.position;
    data['previous_club'] = this.previousClub;
    data['injuries'] = this.injuries;
    data['goals'] = this.goals;
    data['messages_count'] = this.messagesCount;
    data['current_club'] = this.currentClub;
    return data;
  }
}