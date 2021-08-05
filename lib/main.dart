import 'package:bagzz/custom_icon/custom_icon_icons.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  num? devicePixel;

  @override
  Widget build(BuildContext context) {
    devicePixel = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 24 / devicePixel!, vertical: 14 / devicePixel!),
              child: drawerIcon),
          title: const Text(
            'bagzz',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Playfair',
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/avatar.png'),
                radius: 18,
              ),
            )
          ],
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
        bottomNavigationBar: DotNavigationBar(
          currentIndex: -1,
          onTap: (int index) {},
          items: [
            DotNavigationBarItem(
              icon: const Icon(
                CustomIcon.home,
              ),
            ),
            DotNavigationBarItem(
              icon: const Icon(
                CustomIcon.search,
              ),
            ),
            DotNavigationBarItem(
              icon: const Icon(
                CustomIcon.favorite,
              ),
            ),
            DotNavigationBarItem(
              icon: const Icon(
                CustomIcon.shoppping_bag,
              ),
            ),
          ],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
            )
          ],
          itemPadding: EdgeInsets.symmetric(
            vertical: 20 / devicePixel!,
            horizontal: 18 / devicePixel!,
          ),
          paddingR: const EdgeInsets.all(14),
          marginR: const EdgeInsets.all(8),
        ));
  }
}

final Widget drawerIcon = SvgPicture.asset(
  'assets/drawericon.svg',
  height: 14,
  width: 24,
);
