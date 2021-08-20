import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final String image;
  final String title;

  const SliderItem({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                backgroundColor: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
