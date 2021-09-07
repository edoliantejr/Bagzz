import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/views/bag_item_details/bag_item_details_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class BagItemDetailsPage extends StatelessWidget {
  final Bag bag;

  const BagItemDetailsPage({required this.bag, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BagItemDetailsViewModel>.reactive(
      viewModelBuilder: () => BagItemDetailsViewModel(bag: bag),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white30,
              title: Text(model.bag.name,
                  style: TextStyle(
                      fontFamily: FontNames.workSans, color: Colors.black)),
              elevation: 0),
          body: SingleChildScrollView(
            primary: false,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //view for bag, title, price
                Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 192,
                          width: 177,
                          padding: EdgeInsets.all(2),
                          child: CachedNetworkImage(
                            imageUrl: model.bag.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 3),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            Text(
                              model.bag.name,
                              style: TextStyle(
                                  fontFamily: FontNames.playFair,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(model.bag.category,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: FontNames.workSans)),
                            Text(model.bag.style,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: FontNames.workSans,
                                    color: Colors.grey[700])),
                            SizedBox(height: 8),
                            Text('\$${model.bag.price}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontNames.workSans)),
                            SizedBox(height: 8),
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18),
                                    backgroundColor: Colors.black,
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                                child: Text(
                                  'BUY NOW',
                                  style: TextStyle(
                                      fontFamily: FontNames.workSans,
                                      fontSize: 14),
                                )),
                            InkWell(
                              onTap: model.addBagToCart,
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                padding: EdgeInsets.symmetric(vertical: 2),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black, width: 2))),
                                child: Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                      fontFamily: FontNames.workSans,
                                      fontSize: 14,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                            child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined, size: 28),
                        )))
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: model.bagInfoMenu.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            padding: EdgeInsets.symmetric(vertical: 1),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2,
                                        color: model.currentIndex == index
                                            ? Colors.black
                                            : Colors.transparent))),
                            child: TextButton(
                              onPressed: () {
                                model.pageController.jumpToPage(index);
                              },
                              style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero)),
                              child: Text(
                                model.bagInfoMenu[index],
                                style: TextStyle(
                                    fontFamily: FontNames.workSans,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        );
                      }),
                ),

                //page view for bag description, shipping info & payment opt.
                Container(
                  height: MediaQuery.of(context).size.height * .8,
                  width: 714,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    controller: model.pageController,
                    onPageChanged: (index) {
                      model.setCurrentIndex(index);
                    },
                    children: [
                      Text(model.bag.desc,
                          textAlign: TextAlign.start,
                          softWrap: true,
                          style: TextStyle(
                              fontFamily: FontNames.workSans,
                              letterSpacing: 0.85,
                              height: 1.8)),
                      Text(model.bag.shipInfo,
                          softWrap: true,
                          style: TextStyle(
                              fontFamily: FontNames.workSans,
                              letterSpacing: 0.85,
                              height: 1.8)),
                      Text(model.bag.payInfo,
                          softWrap: true,
                          style: TextStyle(
                              fontFamily: FontNames.workSans,
                              letterSpacing: 0.85,
                              height: 1.8)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
