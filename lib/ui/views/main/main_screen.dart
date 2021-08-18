import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/bags_gridview_item.dart';
import 'package:bagzz/ui/views/cart/cart_screen.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/views/wishlist/wish_list_page.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int numCartItems = 0;
  int currentIndex = 0;
  ScrollController scrollController = new ScrollController();
  final List<Bag> bags = [
    Bag(
      id: 2,
      image: 'assets/images/bag02.png',
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
      image: 'assets/images/bag03.png',
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
      image: 'assets/images/bag05.png',
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
      image: 'assets/images/bag04.png',
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
      image: 'assets/images/bag05.png',
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
      image: 'assets/images/bag04.png',
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    num devicePixel = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 24 / devicePixel, vertical: 14 / devicePixel),
                  child: SvgPicture.asset('assets/icons/drawer.svg')),
              title: const Text(
                'bagzz',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontNames.playFair,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      radius: 18,
                    ))
              ],
            )
          ];
        },
        body: HomeScreen(),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

//bottom navigation widget
  Widget bottomNavigation() {
    return Stack(
      children: [
        DotNavigationBar(
          backgroundColor: Colors.white,
          enableFloatingNavBar: true,
          borderRadius: 40,
          selectedItemColor: null,
          currentIndex: -1,
          onTap: (int index) {
            onTabChange(index);
          },
          items: [
            DotNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'),
            ),
            DotNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/search.svg'),
            ),
            DotNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/favorite_filled.svg'),
            ),
            DotNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/cart.svg'),
            ),
          ],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
            )
          ],
          itemPadding: EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 29,
          ),
          // paddingR: const EdgeInsets.all(14),
          marginR: const EdgeInsets.all(8),
        ),
        numShopBagItem(bags_gridview_item.length),
      ],
    );
  }

//widget overlay to show number of items in the cart as a notification alert
  Widget numShopBagItem(int numCartItems) {
    Color color = Colors.black;
    return Positioned(
      top: 28,
      right: 33,
      child: Container(
        decoration: BoxDecoration(
            color: color = numCartItems > 0 ? color : Colors.transparent,
            border: Border.all(
                color: color =
                    numCartItems > 0 ? Colors.white : Colors.transparent),
            borderRadius: BorderRadius.circular(40)),
        height: 20,
        width: 20,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              '$numCartItems',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void onTabChange(int index) {
    setState(() {
      currentIndex = index;

      //show wishlist bottom sheet
      if (index == 2) {
        WishListPage.open(context, bags);
      }

      //show cart bottom sheet
      if (index == 3) {
        CartPage.open(context, bags);
      }
    });
  }
}
