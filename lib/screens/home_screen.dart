import 'package:bagzz/constant/constant.dart';
import 'package:bagzz/models/bags_slides.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //init controller
  final PageController controller =
      PageController(initialPage: 0, keepPage: true);

//override dispose class to also dispose the conroller to avoid memory leakage
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderImageSlider(context, controller),
      ],
    );
  }
}

//Widget for Image Slider on the Home Page Header
Widget HeaderImageSlider(BuildContext context, PageController controller) {
  return Container(
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
              color: colorBlack,
              width: 51,
              child: IconButton(
                color: colorWhite,
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
              color: colorBlack,
              width: 51,
              child: IconButton(
                color: colorWhite,
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
  );
}

//Widget Design for Image Slider
Widget imageSlide(String image, String title) {
  return Stack(
    children: [
      Container(
        color: Colors.grey[100],
        height: 195,
        width: 714,
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
        bottom: 70,
        right: 13,
        child: Container(
          height: 84,
          width: 92,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Playfair',
              background: new Paint()
                ..color = Colors.white
                ..strokeWidth = 27
                ..style = PaintingStyle.stroke,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}
