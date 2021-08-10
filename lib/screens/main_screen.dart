import 'package:bagzz/components/svg_icon.dart';
import 'package:bagzz/constant/constant.dart';
import 'package:bagzz/models/bags_gridview_item.dart';
import 'package:bagzz/screens/home_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int numCartItems = 0;
  @override
  Widget build(BuildContext context) {
    num devicePixel = MediaQuery.of(context).devicePixelRatio;

    return Scaffold(
      backgroundColor: colorWhite,
      body: NestedScrollView(
      
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              
              backgroundColor: colorWhite,
              elevation: 0,
              leading: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 24 / devicePixel, vertical: 14 / devicePixel),
                  child: svgIcon('assets/icons/drawer.svg')),
              title: const Text(
                'bagzz',
                style: TextStyle(
                    color: colorBlack,
                    fontFamily: playFair,
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
}

//bottom navigation widget
Widget bottomNavigation() {
  return Stack(
    children: [
      DotNavigationBar(
        borderRadius: 40,

        currentIndex: -1,
        onTap: (int index) {},
        items: [
          DotNavigationBarItem(
            icon: svgIcon('assets/icons/home.svg'),
          ),
          DotNavigationBarItem(
            icon: svgIcon('assets/icons/search.svg'),
          ),
          DotNavigationBarItem(
            icon: svgIcon('assets/icons/favorite_filled.svg'),
          ),
          DotNavigationBarItem(
            icon: svgIcon('assets/icons/cart.svg'),
          ),
        ],
        boxShadow: [
          BoxShadow(
            color: colorBlack.withOpacity(0.1),
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
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
