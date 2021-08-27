import 'package:bagzz/constant/font_names.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/widgets/bag_grid_view/bag_grid_view_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BagGridView extends StatelessWidget {
  final List<Bag> bags;

  const BagGridView({Key? key, required this.bags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BagGridViewModel>.reactive(
        viewModelBuilder: () => BagGridViewModel(bags),
        builder: (context, model, child) {
          return Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.bags.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: .85,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 11, right: 15, bottom: 11),
                      child: Container(
                        width: 170,
                        color: Color(0XFFF1F1F1),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () => model.onBagImagePressed(index),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Image(
                                        image:
                                            AssetImage(model.bags[index].image),
                                        height: 111,
                                        width: 111,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 9),
                                    child: Text(
                                      model.bags[index].name,
                                      style: TextStyle(
                                          fontFamily: FontNames.playFair,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.0),
                                          primary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero)),
                                      child: Container(
                                        child: Text(
                                          'SHOP NOW',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: FontNames.workSans,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 11.0),
                                    child: Container(
                                      height: 2,
                                      width: 88,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                top: 6,
                                right: 9,
                                child: InkWell(
                                  onTap: model.addToWishList,
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
                  }),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 1.0),
                        backgroundColor: Colors.white,
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
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
              ),
            ],
          );
        });
  }
}
