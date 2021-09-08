import 'dart:async';

import 'package:bagzz/core/service/api/api_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiServiceImpl extends ApiService {
  @override
  Future publishBag(Bag bag) async {
    final bagRef = await FirebaseFirestore.instance.collection('bags');
    return await bagRef.add(bag.bagsToJson());
  }

  @override
  Stream<List<Bag>> getRealTimeBags() {
    return FirebaseFirestore.instance
        .collection('bags')
        .orderBy('price', descending: false)
        .limit(4)
        .snapshots()
        .map((data) =>
            data.docs.map((doc) => Bag.bagsFromJson(doc.data())).toList());
  }
}
