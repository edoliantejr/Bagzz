import 'package:bagzz/models/bag.dart';
import 'package:flutter/material.dart';

import 'image_slider_item.dart';

class ImageSlider extends StatefulWidget {
  final List<Bag> bags;

  const ImageSlider({Key? key, required this.bags}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController controller =
      PageController(initialPage: 0, keepPage: true);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 13,right: 13),
      height: 205,
      width: 714,
      child: Stack(
        fit: StackFit.loose,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: widget.bags.length,
              itemBuilder: (context, i) {
                final item = widget.bags[i];
                return SliderItem(
                  title: item.title,
                  image: item.image,
                );
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
    );
  }
}
