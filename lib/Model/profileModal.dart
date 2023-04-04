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
  String? video;
  Null? socialLink;
  Null? occupation;
  String? position;
  String? previousClub;
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
        this.video,
        this.socialLink,
        this.occupation,
        this.position,
        this.previousClub,
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
    video = json['video'];
    socialLink = json['social_link'];
    occupation = json['occupation'];
    position = json['position'];
    previousClub = json['previous_club'];
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
    data['video'] = this.video;
    data['social_link'] = this.socialLink;
    data['occupation'] = this.occupation;
    data['position'] = this.position;
    data['previous_club'] = this.previousClub;
    data['current_club'] = this.currentClub;
    return data;
  }
}