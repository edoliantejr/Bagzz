import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/category.dart';
import 'package:bagzz/models/user.dart';

abstract class ApiService {
  Future<String> publishBag(Bag bag);

  Future<Bag> getBagDetails({required String bagId});

  Stream<List<Bag>> getRealTimeBags();

  Stream<List<Bag>> getLikeBags(List<String> ids);

  Stream<User> getCurrentUser();

  Future<void> updateUser(User user);

  Stream<List<Category>> getRealTimeCategories();

  Future<List<Bag>> searchListOfBags(String query);

  Future addToCart({required Bag bag, required String uid});

  Stream<List<Bag>> getAllBagsInCart(String userId);

  Future<void> decrementBagQuantity({required Bag bag, required String uid});

  Future<void> incrementBagQuantity({required Bag bag, required String uid});
}
