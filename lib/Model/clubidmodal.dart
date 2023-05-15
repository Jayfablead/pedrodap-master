class Clubidmodal {
  String? message;
  bool? status;
  List<AllClubsFetch>? allClubsFetch;

  Clubidmodal({this.message, this.status, this.allClubsFetch});

  Clubidmodal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['all_clubs_fetch'] != null) {
      allClubsFetch = <AllClubsFetch>[];
      json['all_clubs_fetch'].forEach((v) {
        allClubsFetch!.add(new AllClubsFetch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.allClubsFetch != null) {
      data['all_clubs_fetch'] =
          this.allClubsFetch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllClubsFetch {
  String? uid;
  String? name;

  AllClubsFetch({this.uid, this.name});

  AllClubsFetch.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    return data;
  }
}