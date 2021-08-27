import 'dart:ui';

import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {
  final List<Bag> bags;
  const WishListPage({Key? key, required this.bags}) : super(key: key);

  static open(BuildContext context, List<Bag> bags) {
    return showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0.8),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      builder: (context) {
        return WishListPage(
          bags: bags,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height / 2.5,
          maxHeight: MediaQuery.of(context).size.height * .91),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Container(
                  margin: EdgeInsets.all(12),
                  height: 2,
                  width: 125,
                  color: Colors.black)),
          SizedBox(height: 45),
          Flexible(
            child: bags.isEmpty
                ? Container(
                    height: 100,
                    child: Center(child: Text('No items on wishlist.')),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: bags.length,
                    itemBuilder: (context, i) {
                      return WishListItem(bags[i]);
                    }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 25),
            child: Container(
                height: 43,
                width: 193,
                color: Colors.black,
                child: TextButton(
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'ADD ALL TO CART',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: FontNames.workSans),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class WishListItem extends StatelessWidget {
  final Bag bags;

  const WishListItem(
    this.bags, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              //column for image
              Column(
                children: [
                  Image(
                    image: AssetImage(bags.image),
                    height: 81,
                    width: 81,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),

              SizedBox(
                width: 32,
              ),
              //column for bag info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Text(bags.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontNames.playFair)),
                  SizedBox(height: 8),
                  Text(bags.category,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: FontNames.workSans,
                          fontWeight: FontWeight.w400)),
                  Text(bags.style,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: FontNames.workSans)),
                  SizedBox(height: 20),
                  Text(
                    'REMOVE',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: FontNames.workSans,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                    width: 59,
                  )
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 1,
            width: MediaQuery.of(context).size.width - 65,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
