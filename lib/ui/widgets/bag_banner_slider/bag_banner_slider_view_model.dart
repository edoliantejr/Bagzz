import 'package:bagzz/models/bag.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stacked/stacked.dart';

class BagBannerSliderViewModel extends BaseViewModel {
  final List<Bag> bags;
  CarouselController buttonCarouselController = CarouselController();

  BagBannerSliderViewModel(this.bags);
}
