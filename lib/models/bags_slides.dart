class Bags {
  String image;
  String title;
  String name;

  Bags({required this.image, required this.title, required this.name});
}

final List<Bags> bags = [
  Bags(
      image: 'assets/images/bag-header-01.jpg',
      title: "This season's latest",
      name: "Artsy"),
  Bags(
      image: 'assets/images/bag02.png',
      title: " This season's best buy",
      name: "Artsy"),
  Bags(
      image: 'assets/images/bag03.png',
      title: " This season's popular",
      name: "Artsy"),
  Bags(
      image: 'assets/images/bag04.png',
      title: " This season's latest",
      name: "Artsy"),
];
