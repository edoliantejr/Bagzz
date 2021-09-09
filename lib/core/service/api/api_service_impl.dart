import 'dart:async';

import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:bagzz/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final currentUser = _firebaseAuth.currentUser;

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

  @override
  void addToFavorite(List<Bag> bags, User user) async {
    final userRef = await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUser!.uid);
    var userDoc = await userRef.get();
    if (userDoc.exists) {
      userRef.update(user.wishListToJson(bags));
    }
  }
}
