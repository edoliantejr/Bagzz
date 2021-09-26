class User {
  String id;
  String email;
  String name;
  String image;
  List<String> favoriteBags;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.image,
    required this.favoriteBags,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      image: json['image'],
      favoriteBags:
          json['favoriteBags'] != null ? List.from(json['favoriteBags']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'favoriteBags': favoriteBags,
    };
  }
}
