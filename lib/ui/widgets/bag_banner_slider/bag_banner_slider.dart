import 'package:bagzz/models/bag.dart';
import 'package:bagzz/ui/widgets/bag_banner_slider/bag_banner_slider_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      aspectRatio: 16 / 9,
                      initialPage: 0,
                    ),
                    carouselController: model.buttonCarouselController,
                    itemCount: model.bags.length,
                    itemBuilder: (context, index, realIndex) {
                      //image slider item
                      return Stack(
                        children: [
                          Container(
                            color: Colors.grey[100],
                            height: 195,
                            width: 714,
                            child: Image(
                              image: AssetImage(model.bags[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 70,
                            right: 13,
                            child: Container(
                              width: 100,
                              child: Text(
                                model.bags[index].title,
                                style: TextStyle(
                                  height: .99,
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
                    },
                  ),
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
                            model.buttonCarouselController.previousPage(
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
                            model.buttonCarouselController.nextPage(
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
