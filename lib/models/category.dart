class Category {
  String id;
  String coverImage;
  String categoryTitle;

  Category(
      {required this.id,
      required this.coverImage,
      required this.categoryTitle});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      coverImage: json['coverImage'],
      categoryTitle: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': categoryTitle,
      'coverImage': coverImage,
    };
  }
}
