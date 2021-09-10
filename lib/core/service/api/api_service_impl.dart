import 'dart:async';

import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final currentUser = _firebaseAuth.currentUser;
final userCollection = FirebaseFirestore.instance.collection('users');
final bagCollection = FirebaseFirestore.instance.collection('bags');

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
            data.docs.map((doc) => Bag.bagsFromJson(doc.data())).toList());
  }

  @override
  Future<List<Bag>> getLikeBags(List<String> ids) async {
    var bag;
    bag = await bagCollection.where('id', whereIn: ids).get().then(
        (value) => value.docs.map((e) => Bag.bagsFromJson(e.data())).toList(),
        onError: (onError) => print(onError));
    return bag;
  }

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
