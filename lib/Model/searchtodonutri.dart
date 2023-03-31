class NutritodosearchModal {
  String? status;
  List<NutritionAndHealthTodos>? nutritionAndHealthTodos;

  NutritodosearchModal({this.status, this.nutritionAndHealthTodos});

  NutritodosearchModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['nutrition_and_health_todos'] != null) {
      nutritionAndHealthTodos = <NutritionAndHealthTodos>[];
      json['nutrition_and_health_todos'].forEach((v) {
        nutritionAndHealthTodos!.add(new NutritionAndHealthTodos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.nutritionAndHealthTodos != null) {
      data['nutrition_and_health_todos'] =
          this.nutritionAndHealthTodos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NutritionAndHealthTodos {
  String? id;
  String? playerId;
  String? nutritionAndHealthId;
  String? date;
  String? time;
  String? mealName;
  String? foodName;
  String? quantity;
  String? calories;
  String? protein;
  String? carb;
  String? fat;
  int? completed;
  String? createdAt;

  NutritionAndHealthTodos(
      {this.id,
        this.playerId,
        this.nutritionAndHealthId,
        this.date,
        this.time,
        this.mealName,
        this.foodName,
        this.quantity,
        this.calories,
        this.protein,
        this.carb,
        this.fat,
        this.completed,
        this.createdAt});

  NutritionAndHealthTodos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    nutritionAndHealthId = json['nutrition_and_health_id'];
    date = json['date'];
    time = json['time'];
    mealName = json['meal_name'];
    foodName = json['food_name'];
    quantity = json['quantity'];
    calories = json['calories'];
    protein = json['protein'];
    carb = json['carb'];
    fat = json['fat'];
    completed = json['completed'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_id'] = this.playerId;
    data['nutrition_and_health_id'] = this.nutritionAndHealthId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['meal_name'] = this.mealName;
    data['food_name'] = this.foodName;
    data['quantity'] = this.quantity;
    data['calories'] = this.calories;
    data['protein'] = this.protein;
    data['carb'] = this.carb;
    data['fat'] = this.fat;
    data['completed'] = this.completed;
    data['created_at'] = this.createdAt;
    return data;
  }
}