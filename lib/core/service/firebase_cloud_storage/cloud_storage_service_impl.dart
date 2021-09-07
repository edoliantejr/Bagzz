import 'dart:async';
import 'dart:io';

import 'package:bagzz/core/service/firebase_cloud_storage/cloud_storage_service.dart';
import 'package:bagzz/models/bag_image_upload.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageServiceImpl extends CloudStorageService {
  @override
  Future<BagImageUpload> uploadImage(
      {required File imageToUpload, required String title}) async {
    var downloadUrl;
    bool isUploaded;
    String progress;

    var imageFileName = title;

    final fireBaseStorageRef =
        FirebaseStorage.instance.ref('bags/').child(imageFileName);

    final uploadTask = fireBaseStorageRef.putFile(imageToUpload);

    final StreamSubscription<TaskSnapshot> taskSnapshot =
        await uploadTask.snapshotEvents.listen((event) {
      var uploadPercent = event.bytesTransferred / event.totalBytes * 100;
      progress = '$uploadPercent %';
    }, onError: (error) {
      print(error);
    });

    await uploadTask;
    downloadUrl = await uploadTask.snapshot.ref.getDownloadURL();
    isUploaded = true;
    return BagImageUpload(
        imageUrl: downloadUrl,
        imageFileName: imageFileName,
        isUploaded: isUploaded);
  }
}
