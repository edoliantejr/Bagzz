import 'package:equatable/equatable.dart';

class Bag extends Equatable {
  int id;
  String image;
  String title;
  String name;
  int price;
  String category;
  String style;
  String desc;
  String shipInfo;
  String payInfo;

  Bag(
      {required this.id,
      required this.image,
      required this.title,
      required this.name,
      required this.price,
      required this.category,
      required this.style,
      required this.desc,
      required this.shipInfo,
      required this.payInfo});

  @override
  List<Object?> get props =>
      [id, image, title, name, price, category, style, desc, shipInfo, payInfo];
}
