import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:flutter/material.dart';

class BagGridView extends StatelessWidget {
  final List<Bag> bags;

  const BagGridView({Key? key, required this.bags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: bags.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              childAspectRatio: .9,
            ),
            itemBuilder: (context, i) {
              return BagItem(bags[i]);
            }),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                )),
                child: Text("CHECK ALL LATEST",
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ))),
          ),
        ),
      ],
    );
  }
}

class BagItem extends StatelessWidget {
  final Bag bag;

  const BagItem(this.bag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                )),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image(image: AssetImage(bag.image)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Text(
                      bag.name,
                      style: TextStyle(
                          fontFamily: FontNames.playFair,
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
                            fontFamily: FontNames.workSans,
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
}
