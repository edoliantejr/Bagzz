import 'dart:async';

import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/category.dart';
import 'package:bagzz/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final userCollection = FirebaseFirestore.instance.collection('users');
final bagCollection = FirebaseFirestore.instance.collection('bags');
final categoryCollection = FirebaseFirestore.instance.collection('categories');

class ApiServiceImpl extends ApiService {
  @override
  Future publishBag(Bag bag) async {
    final bagRef = FirebaseFirestore.instance.collection('bags').doc();
    return bagRef
        .set(bag.bagsToJson(bagRef.id))
        .catchError((onError) => print(onError));
  }

  @override
  Stream<List<Bag>> getRealTimeBags() {
    return bagCollection
        .orderBy('price', descending: false)
        .limit(6)
        .snapshots()
        .map((data) =>
            data.docs.map((doc) => Bag.FromJson(doc.data())).toList());
  }

  @override
  Stream<List<Bag>> getLikeBags(List<String> ids) {
    return bagCollection
        .where('id', whereIn: ids)
        .snapshots()
        .map((event) => event.docs.map((e) => Bag.FromJson(e.data())).toList());
  }

  @override
  Stream<User> getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    var currentUser;
    if (user!.uid.isNotEmpty) {
      currentUser = userCollection
          .doc(user.uid)
          .snapshots()
          .map((event) => User.fromJson(event.data() as Map<String, dynamic>));
    }
    return currentUser;
  }

  @override
  Future<void> updateUser(User user) async {
    await userCollection.doc(user.id).update(user.toJson());
  }

  @override
  Stream<List<Category>> getRealTimeCategories() {
    return categoryCollection
        .orderBy('name', descending: false)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Category.fromJson(e.data())).toList());
  }

  @override
  Future<List<Bag>> searchListOfBags(String query) async {
    List<Bag> bags = [];
    if (query.isNotEmpty) {
      bags = await bagCollection
          .where(
            'name',
            isGreaterThanOrEqualTo: query,
          )
          .where('name', isLessThanOrEqualTo: query + '\uf8ff')
          .get()
          .then((value) =>
              value.docs.map((bag) => Bag.FromJson(bag.data())).toList());
    } else {
      bags = [];
    }
    return bags;
  }

  @override
  Future addToCart({required Bag bag, required String uid}) async {
    final usersCartDoc =
        userCollection.doc(uid).collection('cart').doc(bag.id!);

    final bagInCartExist =
        await usersCartDoc.get().then((value) => value.exists);

    if (bagInCartExist) {
      usersCartDoc.update({'bagInCartQuantity': FieldValue.increment(1)});
    } else {
      usersCartDoc.set(bag.bagsToJson(bag.id!));
    }
  }

  @override
  Stream<List<Bag>> getAllBagsInCart(String userId) {
    return userCollection.doc(userId).collection('cart').snapshots().map(
        (event) =>
            event.docs.map((value) => Bag.FromJson(value.data())).toList());
  }

  @override
  Future decrementBagQuantity({required Bag bag, required String uid}) async {
    if (bag.bagInCartQuantity! > 1) {
      ///increment quantity if bagInCartQuantity is >=1
      userCollection
          .doc(uid)
          .collection('cart')
          .doc(bag.id!)
          .update({'bagInCartQuantity': FieldValue.increment(-1)});
    } else {
      ///delete bag in cart if quantity is <=0
      userCollection.doc(uid).collection('cart').doc(bag.id!).delete();
    }
  }

  @override
  Future incrementBagQuantity({required Bag bag, required String uid}) async {
    userCollection
        .doc(uid)
        .collection('cart')
        .doc(bag.id!)
        .update({'bagInCartQuantity': FieldValue.increment(1)});
  }
}
