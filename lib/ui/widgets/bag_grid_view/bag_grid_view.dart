import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/widgets/bag_grid_view/bag_grid_view_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class BagGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BagGridViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => BagGridViewModel(),
      builder: (context, model, child) {
        return Column(
          children: [
            GridView.builder(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 30, bottom: 11),
                shrinkWrap: true,
                primary: false,
                itemCount: model.bagsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  childAspectRatio: .7,
                ),
                itemBuilder: (context, index) {
                  return BagGridViewItem(
                    key: ObjectKey(model.bagsList[index]),
                    isFavorite: model.isFavorite(model.bagsList[index]),
                    bag: model.bagsList[index],
                  );
                }),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
      },
    );
  }
}

class BagGridViewItem extends StatelessWidget {
  final Bag bag;
  final isFavorite;

  BagGridViewItem({Key? key, required this.bag, required this.isFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BagGridViewModel>.reactive(
      viewModelBuilder: () => BagGridViewModel(),
      builder: (context, model, child) {
        return Stack(
          children: [
            InkWell(
              onTap: () => model.onBagImagePressed(bag),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFF1F1F1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: CachedNetworkImage(
                        imageUrl: bag.image,
                        fit: BoxFit.cover,
                      ),
                      width: 150,
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        bag.name,
                        style: TextStyle(
                            fontFamily: FontNames.playFair,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 2, color: Colors.black))),
                        child: Text(
                          'SHOP NOW',
                          style: TextStyle(
                              fontFamily: FontNames.workSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () => model.addToWishList(bag.id!),
                child: Container(
                  height: 50,
                  width: 50,
                  child: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: isFavorite ? Colors.redAccent : Colors.grey,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
