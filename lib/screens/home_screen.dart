import 'package:bagzz/constant/constant.dart';
import 'package:bagzz/models/bags_gridview_item.dart';
import 'package:bagzz/models/bags__image_slides.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<int> likedBagsItemIds = [];
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
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          headerImageSlider(context, controller),
          bagGridView(),
        ],
      ),
    );
  }

//Widget for Image Slider on the Home Page Header
  Widget headerImageSlider(BuildContext context, PageController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11),
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
            fit: BoxFit.cover,
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
                  ..strokeWidth = 30
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

//Widget bagGridviewItems for bagGridView
  Widget bagGridViewItems(int id, String image, String name) {

    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 15, bottom: 11),
      child: Container(
        height: 210,
        width: 170,
        color: Color(0XFFF1F1F1),
        child: Stack(
          children: [
            Positioned(
                top: 6,
                right: 9,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      if (likedBagsItemIds.contains(id)) {
                        likedBagsItemIds.remove(id);
                      } else {
                        likedBagsItemIds.add(id);
                      }
                    });
                  },
                  child: Icon(
                    likedBagsItemIds.contains(id)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: likedBagsItemIds.contains(id)
                        ? Colors.red
                        : Colors.black,
                    size: 24,
                  ),
                )),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image(image: AssetImage(image)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontFamily: playFair,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'SHOP NOW',
                        style: TextStyle(
                            fontFamily: workSans,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 88,
                    color: Colors.black,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//show gridview of bag items
  Widget bagGridView() {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: bags_gridview_item.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          childAspectRatio: .9,
        ),
        itemBuilder: (context, i) {
          return bagGridViewItems(
            bags_gridview_item[i].id,
            bags_gridview_item[i].image,
            bags_gridview_item[i].name,
          );
        });
  }
}
