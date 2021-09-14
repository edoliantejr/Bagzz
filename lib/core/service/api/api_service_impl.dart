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
    final bagRef = await FirebaseFirestore.instance.collection('bags').doc();
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
    return userCollection
        .doc(user!.uid)
        .snapshots()
        .map((event) => User.fromJson(event.data()!));

    // final user = await _firebaseAuth.currentUser;
    // return await userCollection
    //     .doc(user!.uid)
    //     .get()
    //     .then((user) => User.fromJson(user.data()!));
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
}
