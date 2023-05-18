class Filtermodal {
  String? message;
  String? status;
  List<SearchData>? searchData;

  Filtermodal({this.message, this.status, this.searchData});

  Filtermodal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['search_data'] != null) {
      searchData = <SearchData>[];
      json['search_data'].forEach((v) {
        searchData!.add(new SearchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.searchData != null) {
      data['search_data'] = this.searchData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchData {
  String? uid;
  String? clubName;
  String? name;
  String? occupation;
  int? connections;
  String? profilePic;

  SearchData(
      {this.uid,
        this.clubName,
        this.name,
        this.occupation,
        this.connections,
        this.profilePic});

  SearchData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    clubName = json['club_name'];
    name = json['name'];
    occupation = json['occupation'];
    connections = json['connections'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['club_name'] = this.clubName;
    data['name'] = this.name;
    data['occupation'] = this.occupation;
    data['connections'] = this.connections;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}