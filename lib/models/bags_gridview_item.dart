class Bags_Item {
  String image;
  String title;
  String name;

  Bags_Item({required this.image, required this.title, required this.name});
}

final List<Bags_Item> bags_gridview_item = [
  Bags_Item(
      image: 'assets/images/bag02.png',
      title: " This season's best buy",
      name: "Artsy"),
  Bags_Item(
      image: 'assets/images/bag03.png',
      title: " This season's popular",
      name: "Berkely"),
  Bags_Item(
      image: 'assets/images/bag04.png',
      title: " This season's latest",
      name: "Capucinos"),
  Bags_Item(
      image: 'assets/images/bag05.png',
      title: " This season's latest",
      name: "Monogram"),
];
