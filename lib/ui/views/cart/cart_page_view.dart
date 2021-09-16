import 'dart:ui';

import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cart_page_viewmodel.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  static Future<dynamic> open(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: false,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.8),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      builder: (cxt) {
        return CartPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartPageViewModel>.reactive(
        viewModelBuilder: () => CartPageViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, widget) {
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
                  child: model.bagsInCart.isEmpty
                      ? Container(
                          height: 100,
                          child: Center(child: Text('Cart is empty. Add item')),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: model.bagsInCart.length,
                          itemBuilder: (context, i) {
                            return CartItem(
                              bag: model.bagsInCart[i],
                              quantity: model.bagsInCart[i].bagInCartQuantity!,
                              decrementQuantity: () =>
                                  model.decrementOrDeleteBagInCartQuantity(
                                      model.bagsInCart[i],
                                      model.currentUser!.id),
                              incrementQuantity: () =>
                                  model.incrementBagInCartQuantity(
                                      model.bagsInCart[i],
                                      model.currentUser!.id),
                            );
                          }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 15),
                  child: model.bagsInCart.isEmpty
                      ? Container()
                      : Container(
                          height: 43,
                          width: 193,
                          color: Colors.black,
                          child: TextButton(
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                'PROCEED TO BUY',
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
        });
  }
}

class CartItem extends StatelessWidget {
  final Bag bag;
  final int quantity;
  final VoidCallback decrementQuantity;
  final VoidCallback incrementQuantity;

  const CartItem({
    Key? key,
    required this.bag,
    required this.quantity,
    required this.decrementQuantity,
    required this.incrementQuantity,
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
                  CachedNetworkImage(
                    imageUrl: bag.image,
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
                        GestureDetector(
                          onTap: () => decrementQuantity(),
                          child: Container(
                            width: 29,
                            height: 25,
                            color: Colors.black,
                            child: Center(
                                child: Text('-',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))),
                          ),
                        ),
                        Container(
                          width: 29,
                          height: 25,
                          color: Colors.white,
                          child: Center(
                              child: Text('$quantity',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16))),
                        ),
                        GestureDetector(
                          onTap: () => incrementQuantity(),
                          child: Container(
                            width: 29,
                            height: 25,
                            color: Colors.black,
                            child: Center(
                                child: Text(
                              '+',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                          ),
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
                  Text(bag.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontNames.playFair)),
                  SizedBox(height: 8),
                  Text(bag.category,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: FontNames.workSans,
                          fontWeight: FontWeight.w400)),
                  Text(bag.style,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: FontNames.workSans)),
                  SizedBox(height: 20),
                  Text(
                    '${bag.price}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: FontNames.workSans,
                        fontWeight: FontWeight.bold),
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
