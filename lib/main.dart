import 'package:bagzz/custom_icon/custom_icon_icons.dart';
import 'package:bagzz/models/bags_slides.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    num devicePixel = MediaQuery.of(context).devicePixelRatio;
    final PageController controller =
        PageController(initialPage: 0, keepPage: true);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 24 / devicePixel, vertical: 14 / devicePixel),
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
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  radius: 18,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 28, horizontal: 12),
              height: 205,
              width: 714,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  PageView.builder(
                      controller: controller,
                      itemCount: bags.length,
                     
                      itemBuilder: (context, i) {
                        return imageSlide(bags[i].image, bags[i].title);
                      }),
                  Positioned(
                    top: 154,
                    right: 10,
                    child: Row(children: [
                      Container(
                        height: 51,
                        color: Colors.black,
                        width: 51,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
        
                            controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          icon: Icon(Icons.arrow_back),
                          iconSize: 26,
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        height: 51,
                        color: Colors.black,
                        width: 51,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                           controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          icon: Icon(Icons.arrow_forward),
                          iconSize: 26,
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ],
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
            vertical: 20 / devicePixel,
            horizontal: 18 / devicePixel,
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

Widget imageSlide(String? image, String? title) {
  return Stack(
    children: [
      Container(
        color: Colors.grey[100],
        height: 195,
        width: 714,
        child: Image(
          image: AssetImage(image!),
          fit: BoxFit.none,
        ),
      ),
      Positioned(
        bottom: 70,
        right: 13,
        child: Text(
          title!,
          style: TextStyle(
            fontFamily: 'Playfair',
            backgroundColor: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}
