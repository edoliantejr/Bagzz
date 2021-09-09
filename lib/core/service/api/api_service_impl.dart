import 'dart:async';

import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final currentUser = _firebaseAuth.currentUser;
final userCollection = FirebaseFirestore.instance.collection('users');

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
    return FirebaseFirestore.instance
        .collection('bags')
        .orderBy('price', descending: false)
        .limit(6)
        .snapshots()
        .map((data) =>
            data.docs.map((doc) => Bag.bagsFromJson(doc.data())).toList());
  }

  // @override
  // void addToFavorite(User user) async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.id)
  //       .update(user.toJson());
  // }

  @override
  Future<User> getCurrentUser() {
    final currentUser = _firebaseAuth.currentUser;
    return userCollection
        .doc(currentUser!.uid)
        .get()
        .then((user) => User.fromJson(user.data()!));
  }

  @override
  Future<void> updateUser(User user) async {
    await userCollection.doc(user.id).update(user.toJson());
  }
}
