import 'dart:math';
import 'dart:ui';
import 'package:bagzz/constant/constant.dart';
import 'package:bagzz/models/bags_gridview_item.dart';
import 'package:flutter/material.dart';

//design for cart item
Widget cartItems(BuildContext context, String image, String name, int quantity,
    String category, String style, int price) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Column(
      children: [
        Container(
          height: 116.38,
          width: MediaQuery.of(context).size.width - 65,
          child: Row(
            children: [
              //column for image
              Column(
                children: [
                  Image(
                    image: AssetImage(image),
                    height: 81,
                    width: 81,
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //design for add and minus quantity
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 29,
                          height: 25,
                          color: colorBlack,
                          child: Center(
                              child: Text('-',
                                  style: TextStyle(
                                      color: colorWhite, fontSize: 14))),
                        ),
                        Container(
                          width: 29,
                          height: 25,
                          color: colorWhite,
                          child: Center(
                              child: Text('$quantity',
                                  style: TextStyle(
                                      color: colorBlack, fontSize: 14))),
                        ),
                        Container(
                          width: 29,
                          height: 25,
                          color: colorBlack,
                          child: Center(
                              child: Text(
                            '+',
                            style: TextStyle(color: colorWhite, fontSize: 14),
                          )),
                        )
                      ],
                    ),
                  )
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
                  Text(name,
                      style: TextStyle(
                          color: colorBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: playFair)),
                  SizedBox(height: 8),
                  Text(category,
                      style: TextStyle(
                          color: colorBlack,
                          fontSize: 12,
                          fontFamily: workSans,
                          fontWeight: FontWeight.w400)),
                  Text(style,
                      style: TextStyle(
                          color: colorBlack,
                          fontSize: 10,
                          fontFamily: workSans)),
                  SizedBox(height: 20),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        color: colorBlack,
                        fontSize: 18,
                        fontFamily: workSans,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 2,
          width: MediaQuery.of(context).size.width - 65,
          color: colorBlack,
        )
      ],
    ),
  );
}

//list view to show cart items
Widget cartItemsListView() {
  return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, i) {
        Random _random = new Random();
        return cartItems(
            context,
            bags_gridview_item[i].image,
            bags_gridview_item[i].name,
            _random.nextInt(10),
            bags_gridview_item[i].category,
            bags_gridview_item[i].style,
            bags_gridview_item[i].price);
      });
}
