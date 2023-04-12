class Userprofilemodal {
  String? status;
  UserProfileDetails? userProfileDetails;

  Userprofilemodal({this.status, this.userProfileDetails});

  Userprofilemodal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userProfileDetails = json['user_profile_details'] != null
        ? new UserProfileDetails.fromJson(json['user_profile_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.userProfileDetails != null) {
      data['user_profile_details'] = this.userProfileDetails!.toJson();
    }
    return data;
  }
}

class UserProfileDetails {
  String? uid;
  String? role;
  String? clubId;
  String? name;
  String? email;
  String? createdAt;
  String? phone;
  String? address;
  String? about;
  String? profilePic;
  String? availability;
  String? experience;
  String? age;
  String? position;
  String? previousClub;
  String? previousClubImage;
  List<String>? images;
  String? video;
  String? clubName;
  String? currentClubImage;
  int? connections;
  int? requestStatus;

  UserProfileDetails(
      {this.uid,
        this.role,
        this.clubId,
        this.name,
        this.email,
        this.createdAt,
        this.phone,
        this.address,
        this.about,
        this.profilePic,
        this.availability,
        this.experience,
        this.age,
        this.position,
        this.previousClub,
        this.previousClubImage,
        this.images,
        this.video,
        this.clubName,
        this.currentClubImage,
        this.connections,
        this.requestStatus});

  UserProfileDetails.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    role = json['role'];
    clubId = json['club_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    phone = json['phone'];
    address = json['address'];
    about = json['about'];
    profilePic = json['profile_pic'];
    availability = json['availability'];
    experience = json['experience'];
    age = json['age'];
    position = json['position'];
    previousClub = json['previous_club'];
    previousClubImage = json['previous_club_image'];
    images = json['images'].cast<String>();
    video = json['video'];
    clubName = json['club_name'];
    currentClubImage = json['current_club_image'];
    connections = json['connections'];
    requestStatus = json['request_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['role'] = this.role;
    data['club_id'] = this.clubId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['about'] = this.about;
    data['profile_pic'] = this.profilePic;
    data['availability'] = this.availability;
    data['experience'] = this.experience;
    data['age'] = this.age;
    data['position'] = this.position;
    data['previous_club'] = this.previousClub;
    data['previous_club_image'] = this.previousClubImage;
    data['images'] = this.images;
    data['video'] = this.video;
    data['club_name'] = this.clubName;
    data['current_club_image'] = this.currentClubImage;
    data['connections'] = this.connections;
    data['request_status'] = this.requestStatus;
    return data;
  }
}