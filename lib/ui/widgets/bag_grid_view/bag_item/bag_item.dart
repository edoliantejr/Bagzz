import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/widgets/bag_grid_view/bag_item/bag_item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BagItem extends StatelessWidget {
  final Bag bag;

  const BagItem(this.bag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BagItemViewModel>.reactive(
      viewModelBuilder: () => BagItemViewModel(bag),
      builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 11, right: 15, bottom: 11),
          child: Container(
            height: 210,
            width: 170,
            color: Color(0XFFF1F1F1),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Image(image: AssetImage(bag.image)),
                        ),
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
                                fontSize: 15),
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
                ),
                Positioned(
                    top: 6,
                    right: 9,
                    child: InkWell(
                      onTap:  model.addToWishList,
                      child: Container(
                        padding: EdgeInsets.all(6),

                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
