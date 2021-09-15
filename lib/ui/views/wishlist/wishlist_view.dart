import 'dart:ui';

import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/views/wishlist/wishlist_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  static open(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white.withOpacity(0.8),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      builder: (context) {
        return WishListPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WishlistViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => WishlistViewModel(),
      builder: (context, model, child) {
        return !model.isBusy
            ? ConstrainedBox(
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
                          color: Colors.black),
                    ),
                    SizedBox(height: 45),
                    Flexible(
                      child: model.bagsList.isEmpty
                          ? Container(
                              height: 100,
                              child:
                                  Center(child: Text('No items on wishlist.')),
                            )
                          : RefreshIndicator(
                              onRefresh: () => model.getLikedBags(),
                              child: ListView.builder(
                                  key: ObjectKey(model.bagsList),
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  primary: true,
                                  itemCount: model.bagsList.length,
                                  itemBuilder: (context, i) {
                                    return WishListItem(
                                      key: ObjectKey(context),
                                      bag: model.bagsList[i],
                                      deleteLikedBag: () =>
                                          model.deleteLikedBag(
                                              model.bagsList[i].id!),
                                    );
                                  }),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 25),
                      child: model.bagsList.isEmpty
                          ? Container()
                          : Container(
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
              )
            : Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          margin: EdgeInsets.all(12),
                          height: 2,
                          width: 125,
                          color: Colors.black),
                    ),
                    SizedBox(height: 100),
                    Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            Text('Please wait..'),
                            SizedBox(height: 10),
                            CircularProgressIndicator()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class WishListItem extends StatelessWidget {
  final Bag bag;
  final VoidCallback deleteLikedBag;

  const WishListItem({
    required this.bag,
    required this.deleteLikedBag,
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
                  CachedNetworkImage(
                    imageUrl: bag.image,
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
                  InkWell(
                    onTap: () => deleteLikedBag(),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                      child: Text(
                        'REMOVE',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: FontNames.workSans,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
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
