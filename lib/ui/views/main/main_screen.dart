import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/ui/views/cart/cart_screen_view_model.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/views/main/main_screen_view_model.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num devicePixel = MediaQuery.of(context).devicePixelRatio;

    return ViewModelBuilder<MainScreenViewModel>.reactive(
        viewModelBuilder: () => MainScreenViewModel(),
        builder: (context, model, widget) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 24 / devicePixel,
                            vertical: 14 / devicePixel),
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
                            backgroundImage:
                                AssetImage('assets/images/avatar.jpg'),
                            radius: 18,
                          ))
                    ],
                  )
                ];
              },
              body: HomeScreen(),
            ),
            bottomNavigationBar: MyBottomNavigation(
                onTabChange: (index) => model.onTabChange(index, context)),
          );
        });
  }
}

class MyBottomNavigation extends ViewModelWidget<CartScreenViewModel> {
  final ValueChanged<int> onTabChange;

  const MyBottomNavigation({
    Key? key,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CartScreenViewModel model) {
    return Stack(
      children: [
        DotNavigationBar(
          backgroundColor: Colors.white,
          enableFloatingNavBar: true,
          borderRadius: 40,
          selectedItemColor: null,
          currentIndex: -1,
          onTap: onTabChange,
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
        numShopBagItem(model.shoppingCart.length),
      ],
    );
    ;
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
}
