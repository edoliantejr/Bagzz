import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'my_bottom_navigation_view_model.dart';

class MyBottomNavigation extends StatelessWidget {
  final ValueChanged<int> onTabChange;

  const MyBottomNavigation({
    Key? key,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyBottomNavigationViewModel>.reactive(
        viewModelBuilder: () => MyBottomNavigationViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, widget) {
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
        });
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
