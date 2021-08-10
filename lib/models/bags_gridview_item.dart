class Bags_Item {
  int id;
  String image;
  String title;
  String name;

  Bags_Item(
      {required this.id,
      required this.image,
      required this.title,
      required this.name});
}

final List<Bags_Item> bags_gridview_item = [
  Bags_Item(
      id: 1,
      image: 'assets/images/bag02.png',
      title: " This season's best buy",
      name: "Artsy"),
  Bags_Item(
      id: 2,
      image: 'assets/images/bag03.png',
      title: " This season's popular",
      name: "Berkely"),
  Bags_Item(
      id: 3,
      image: 'assets/images/bag04.png',
      title: " This season's latest",
      name: "Capucinos"),
  Bags_Item(
      id: 4,
      image: 'assets/images/bag05.png',
      title: " This season's latest",
      name: "Monogram"),
];
