import 'package:bagzz/models/bags__image_slides.dart';
import 'package:bagzz/models/bags_gridview_item.dart';
import 'package:bagzz/models/category.dart';
import 'package:bagzz/ui/widgets/bag_grid_view.dart';
import 'package:bagzz/ui/widgets/category_grid_view.dart';
import 'package:bagzz/ui/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //list for storing liked bags
  final List<int> likedBags = [];

  //init controller
  final PageController controller =
      PageController(initialPage: 0, keepPage: true);

  final List<Category> categlist = [
    Category(
        id: 1, image: 'assets/images/model1.png', categoryTitle: 'Handle Bags'),
    Category(
        id: 2,
        image: 'assets/images/model2.png',
        categoryTitle: 'Crossbody Bags'),
    Category(
        id: 3,
        image: 'assets/images/model3.png',
        categoryTitle: 'Shoulder Bags'),
    Category(
        id: 4, image: 'assets/images/model4.png', categoryTitle: 'Tote Bags'),
  ];

//override dispose class to also dispose the controller to avoid memory leakage
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageSlider(bags),
          BagGridView(bags: bags_gridview_item),
          CategoryGridView(
            categories: categlist,
          )
        ],
      ),
    );
  }
}
