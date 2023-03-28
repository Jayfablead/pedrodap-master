class NutriallreplyModal {
  String? status;
  List<NutritionAndHealthReplies>? nutritionAndHealthReplies;

  NutriallreplyModal({this.status, this.nutritionAndHealthReplies});

  NutriallreplyModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['nutrition_and_health_replies'] != null) {
      nutritionAndHealthReplies = <NutritionAndHealthReplies>[];
      json['nutrition_and_health_replies'].forEach((v) {
        nutritionAndHealthReplies!
            .add(new NutritionAndHealthReplies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.nutritionAndHealthReplies != null) {
      data['nutrition_and_health_replies'] =
          this.nutritionAndHealthReplies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NutritionAndHealthReplies {
  String? date;
  String? time;
  String? reply;

  NutritionAndHealthReplies({this.date, this.time, this.reply});

  NutritionAndHealthReplies.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    time = json['time'];
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['time'] = this.time;
    data['reply'] = this.reply;
    return data;
  }
}