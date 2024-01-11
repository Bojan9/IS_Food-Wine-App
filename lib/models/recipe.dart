class Recipe {
  final String name;
  final int caloryCount;
  final int type;
  final String imageUrl;

  Recipe({required this.name, required this.caloryCount, required this.type, required this.imageUrl});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        caloryCount: json['caloryCount'] as int,
        type: json['type'] as int,
        imageUrl: json['imageUrl'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $caloryCount, rating: $type, totalTime: $imageUrl}';
  }
}