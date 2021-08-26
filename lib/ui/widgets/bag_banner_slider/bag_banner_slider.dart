import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/widgets/bag_banner_slider/bag_banner_slider_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BagBannerSlider extends StatelessWidget {
  final List<Bag> bags;

  const BagBannerSlider({required this.bags, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BagBannerSliderViewModel>.reactive(
        viewModelBuilder: () => BagBannerSliderViewModel(bags),
        builder: (context, model, child) => Container(
              margin: EdgeInsets.only(left: 13, right: 13),
              height: 205,
              width: 714,
              child: Stack(
                children: [
                  PageView.builder(
                      controller: model.controller,
                      itemCount: model.bags.length,
                      itemBuilder: (context, i) {
                        //image slider item
                        return Stack(
                          children: [
                            Container(
                              color: Colors.grey[100],
                              height: 195,
                              width: 714,
                              child: Image(
                                image: AssetImage(model.bags[i].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 70,
                              right: 13,
                              child: Container(
                                height: 84,
                                width: 92,
                                child: Text(
                                  model.bags[i].title,
                                  style: TextStyle(
                                    fontFamily: 'Playfair',
                                    backgroundColor: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  Positioned(
                    top: 154,
                    right: 10,
                    child: Row(children: [
                      Container(
                        height: 51,
                        color: Colors.black,
                        width: 51,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            model.controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          icon: Icon(Icons.arrow_back),
                          iconSize: 26,
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        height: 51,
                        color: Colors.black,
                        width: 51,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            model.controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          icon: Icon(Icons.arrow_forward),
                          iconSize: 26,
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ));
  }
}
