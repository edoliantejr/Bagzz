class User {
  String id;
  String email;
  String name;
  List<String> favoriteBags;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.favoriteBags,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      favoriteBags:
          json['favoriteBags'] != null ? List.from(json['favoriteBags']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'favoriteBags': favoriteBags,
    };
  }
}
