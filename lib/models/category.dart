class Category {
  int id;
  String image;
  String categoryTitle;
  Category(
      {required this.id, required this.image, required this.categoryTitle});
}

final List<Category> categlist = [
  Category(
      id: 1, image: 'assets/images/model1.png', categoryTitle: 'Handle Bags'),
  Category(
      id: 2,
      image: 'assets/images/model2.png',
      categoryTitle: 'Crossbody Bags'),
  Category(
      id: 3, image: 'assets/images/model3.png', categoryTitle: 'Shoulder Bags'),
  Category(
      id: 4, image: 'assets/images/model4.png', categoryTitle: 'Tote Bags'),
];
