import 'package:equatable/equatable.dart';

class Bag extends Equatable {
  final String? id;
  final String name;
  final String image;
  final String? title;
  final String category;
  final String style;
  final String desc;
  final String shipInfo;
  final String payInfo;
  final double price;
  final bool? isLatest;

  Bag(
      {this.id,
      required this.image,
      this.title,
      required this.name,
      required this.price,
      required this.category,
      required this.style,
      required this.desc,
      required this.shipInfo,
      required this.payInfo,
      this.isLatest});

  @override
  List<Object?> get props =>
      [id, image, title, name, price, category, style, desc, shipInfo, payInfo];

  factory Bag.bagsFromJson(Map<String, dynamic> json) {
    return Bag(
        id: json['id'],
        image: json['image'],
        title: json['title'],
        name: json['name'],
        price: json['price'].toDouble(),
        category: json['category'],
        style: json['style'],
        desc: json['desc'],
        shipInfo: json['shipInfo'],
        payInfo: json['payInfo'],
        isLatest: json['isLatest']);
  }

  Map<String, dynamic> bagsToJson(String id) {
    return {
      'id': id,
      'image': image,
      'title': title,
      'name': name,
      'price': price,
      'category': category,
      'style': style,
      'desc': desc,
      'shipInfo': shipInfo,
      'payInfo': payInfo,
      'isLatest': isLatest
    };
  }


}
