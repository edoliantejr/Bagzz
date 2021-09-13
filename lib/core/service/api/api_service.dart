import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';

abstract class ApiService {
  Future publishBag(Bag bag);

  Stream<List<Bag>> getRealTimeBags();

  Future<List<Bag>> getLikeBags(List<String> ids);

  Future<User> getCurrentUser();

  Future<void> updateUser(User user);

  Future <List<Bag>> searchListOfBags(String query);
// Future<List<Category>> getBagCategories({int max = -1});
//
// Stream<Map<Bag, int>> getCart();
//
// void addToCart(Bag bag);
//
// void removeFromCart(Bag bag);
//
// void addToFavorite(Bag bag);
//
// void removeFromFavorite(Bag bag);
//
// Future<List<Bag>> searchBag(String query);
//

}
