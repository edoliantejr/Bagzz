import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/category.dart';

abstract class ApiService {
  Future<List<Bag>> getAllBags();

  Future<List<Category>> getBagCategories({int max = -1});

  Stream<Map<Bag, int>> getCart();

  void addToCart(Bag bag);

  void removeFromCart(Bag bag);

  void addToFavorite(Bag bag);

  void removeFromFavorite(Bag bag);

  Future<List<Bag>> searchBag(String query);
}
