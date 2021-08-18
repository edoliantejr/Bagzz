import 'dart:ui';

import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/views/wishlist/wish_list_item.dart';
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
            child: ListView.builder(
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
