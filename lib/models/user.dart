import 'package:bagzz/models/bag.dart';

class User {
  String id;
  String? email;
  String? name;
  List<String> favoriteBags;

  User(
    this.id,
    this.email,
    this.name,
      this.favoriteBags,);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['email'],
      json['name'],
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

  Map<String, dynamic> wishListToJson(List<Bag> bags) {
    return {'favoriteBags': bags};
  }
}
