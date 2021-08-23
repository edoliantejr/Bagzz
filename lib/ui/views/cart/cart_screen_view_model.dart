import 'package:bagzz/models/bag.dart';
import 'package:stacked/stacked.dart';

class CartScreenViewModel extends BaseViewModel {
  final Map<Bag, int> shoppingCart = {};

  List<Bag> get bagsOnCart => shoppingCart.keys.toList();

  void addToCart(Bag bag) {
    int bagCartQuantity = shoppingCart[bag] ?? 0;
    shoppingCart[bag] = bagCartQuantity++;
  }

  void removeToCart(Bag bag) {
    int bagCartQuantity = shoppingCart[bag] ?? 0;
    if (bagCartQuantity <= 1) {
      shoppingCart.remove(bag);
    } else {
      shoppingCart[bag] = bagCartQuantity--;
    }
  }
}
