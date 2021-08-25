import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/views/cart/cart_page_view.dart';
import 'package:bagzz/ui/views/home/home_screen.dart';
import 'package:bagzz/ui/views/main/main_screen_viewmodel.dart';
import 'package:bagzz/ui/views/search/search_view.dart';
import 'package:bagzz/ui/views/wishlist/wishlist_view.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainScreenViewModel>.reactive(
        viewModelBuilder: () => MainScreenViewModel(),
        onModelReady: (model) => model.init(),
        builder: (builder, model, child) {
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
                          padding: EdgeInsets.symmetric(horizontal: 13),
                          width: 24,
                          height: 14,
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
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                              radius: 18,
                            ))
                      ],
                    )
                  ];
                },
                body: HomeScreen(),
              ),
              bottomNavigationBar: bottomNavigation(model.bagsList));
        });
  }

//bottom navigation widget
  Widget bottomNavigation(List<Bag> bags) {
    return Stack(
      children: [
        DotNavigationBar(
          backgroundColor: Colors.white,
          enableFloatingNavBar: true,
          borderRadius: 40,
          selectedItemColor: null,
          currentIndex: -1,
          onTap: (int index) {
            onTabChange(index, bags);
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
        numShopBagItem(bags.length),
      ],
    );
  }

//widget overlay to show number of items in the cart as a notification alert
  Widget numShopBagItem(int numCartItems) {
    return Positioned(
      top: 28,
      right: 33,
      child: Container(
        decoration: BoxDecoration(
            color: numCartItems > 0 ? Colors.black : Colors.transparent,
            border: Border.all(
                color: numCartItems > 0 ? Colors.white : Colors.transparent),
            borderRadius: BorderRadius.circular(40)),
        height: 20,
        width: 20,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              '$numCartItems',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void onTabChange(int index, List<Bag> bags) {
    //show search bottom sheet
    if (index == 1) {
      SearchBottomSheet.open(context, bags);
    }

    //show wishlist bottom sheet
    if (index == 2) {
      WishListPage.open(context, bags);
    }

    //show cart bottom sheet
    if (index == 3) {
      CartPage.open(context, bags);
    }
  }
}
