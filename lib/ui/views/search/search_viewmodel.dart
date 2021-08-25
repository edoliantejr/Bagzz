import 'package:bagzz/models/bag.dart';
import 'package:stacked/stacked.dart';

class SearchBottomSheetViewModel extends BaseViewModel {
  List<Bag> searchListOfBags = [];

  void init() {}

  void getListOfBags() {
    searchListOfBags.clear();
    final addidasBag = Bag(
      id: 1,
      image: 'assets/images/bag-header-02.png',
      title: " This season's popular",
      name: "Artsy black sling bag",
      price: 1364,
      category: 'Wallet with chain',
      style: 'Style #36252 0YK0G 1000',
      desc: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      shipInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      payInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
    );
    final nikeBag = Bag(
      id: 2,
      image: 'assets/images/bag-header-02.png',
      title: " This season's popular",
      name: "Berkeley sling bag",
      price: 1364,
      category: 'Wallet with chain',
      style: 'Style #36252 0YK0G 1000',
      desc: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      shipInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      payInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
    );
    final pumaBag = Bag(
      id: 3,
      image: 'assets/images/bag-header-02.png',
      title: " This season's popular",
      name: "Sling bag blue color",
      price: 1364,
      category: 'Wallet with chain',
      style: 'Style #36252 0YK0G 1000',
      desc: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      shipInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
      payInfo: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
          ' Vitae congue mauris rhoncus aenean vel elit. ',
    );
    searchListOfBags.add(addidasBag);
    searchListOfBags.add(nikeBag);
    searchListOfBags.add(pumaBag);
    notifyListeners();
  }
}
