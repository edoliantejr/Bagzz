class User {
  String id;
  String email;
  String password;
  String name;
  String image;
  List<String> favoriteBags;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.image,
    required this.favoriteBags,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      image: json['image'],
      favoriteBags:
          json['favoriteBags'] != null ? List.from(json['favoriteBags']) : [],
    );
  }

  Map<String, dynamic> toJson(String id) {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'image': image,
      'favoriteBags': favoriteBags,
    };
  }
}
