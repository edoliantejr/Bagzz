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
      image: 'assets/images/bag-header-02.jpg',
      title: "This season's latest",
      name: "Artsy"),
];
