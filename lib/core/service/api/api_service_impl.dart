import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/core/service/api/mock_data.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/category.dart';

class ApiServiceImpl extends ApiService {
  @override
  void addToCart(Bag bag) {
    var latestCart = MOCK_CART_STREAM.value;
    int bagCartQuantity = latestCart[bag] ?? 0;
    latestCart[bag] = ++bagCartQuantity;
    MOCK_CART_STREAM.add(latestCart);
  }

  @override
  void addToFavorite(Bag bag) {
    // TODO: implement addToFavorite
  }

  @override
  Future<List<Bag>> getAllBags({int max = -1}) async {
    if (max == 0) {
      return [];
    } else if (max < 0) {
      return MOCK_BAGS;
    }
    final maxCount = max > MOCK_BAGS.length ? MOCK_BAGS.length : max;
    return MOCK_BAGS.sublist(0, maxCount);
  }

  @override
  Future<List<Category>> getBagCategories({int max = -1}) async {
    if (max == 0) {
      return [];
    } else if (max < 0) {
      return MOCK_CATEGORIES;
    }
    final maxCount =
        max > MOCK_CATEGORIES.length ? MOCK_CATEGORIES.length : max;
    return MOCK_CATEGORIES.sublist(0, maxCount);
  }

  @override
  Stream<Map<Bag, int>> getCart() {
    return MOCK_CART_STREAM.stream;
  }

  @override
  void removeFromCart(Bag bag) {
    var latestCart = MOCK_CART_STREAM.value;
    int bagCartQuantity = latestCart[bag] ?? 0;
    if (bagCartQuantity <= 1) {
      latestCart.remove(bag);
    } else {
      latestCart[bag] = --bagCartQuantity;
    }
    MOCK_CART_STREAM.add(latestCart);
  }

  @override
  void removeFromFavorite(Bag bag) {}

  @override
  Future<List<Bag>> searchBag(String query) async {
    return MOCK_BAGS.where((bag) => bag.name.contains(query)).toList();
  }
}
