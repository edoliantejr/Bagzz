import 'package:bagzz/models/bag.dart';
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
  final List<Bag> bags = [
    Bag(
      id: 2,
      image: 'assets/images/bag-header-01.jpg',
      title: "This season's latest",
      name: "Artsy",
      price: 1364,
      category: 'Wallet with chain',
      style: 'Style #36252 0YK0G 1000',
      desc: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      shipInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      payInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
    ),
    Bag(
      id: 1,
      image: 'assets/images/bag-header-02.jpg',
      title: "This season's latest",
      name: "Artsy",
      price: 1364,
      category: 'Wallet with chain',
      style: 'Style #36252 0YK0G 1000',
      desc: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      shipInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      payInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
    ),
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
          ImageSlider(bags: bags),
          BagGridView(bags: bags_gridview_item),
          CategoryGridView(
            categories: categlist,
          )
        ],
      ),
    );
  }
}
