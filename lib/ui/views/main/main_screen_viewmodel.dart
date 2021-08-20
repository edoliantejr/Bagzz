import 'package:bagzz/models/bag.dart';
import 'package:stacked/stacked.dart';

class MainScreenViewModel extends BaseViewModel {
  final List<Bag> bagsList = [];
  int numCartItems = 0;
  int currentIndex = 0;

  void init() {
    setBusy(true);
    loadCartData();
    setBusy(false);
  }

  //for demo , load cart and wishlist containing list of bags
  void loadCartData() {
    final List<Bag> bags = [
      Bag(
        id: 1,
        image: 'assets/images/bag02.png',
        title: " This season's best buy",
        name: "Artsy",
        price: 564,
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
      ),
      Bag(
        id: 2,
        image: 'assets/images/bag03.png',
        title: " This season's popular",
        name: "Berkely",
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
      ),
      Bag(
        id: 3,
        image: 'assets/images/bag04.png',
        title: " This season's latest",
        name: "Capucinos",
        price: 899,
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
      ),
      Bag(
        id: 4,
        image: 'assets/images/bag05.png',
        title: " This season's latest",
        name: "Monogram",
        price: 2999,
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
      ),
    ];
    bagsList.addAll(bags);
  }

}
