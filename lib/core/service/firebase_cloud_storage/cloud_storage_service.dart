import 'package:bagzz/models/cloud_storage.dart';

abstract class CloudStorageService {
  Future<CloudStorageResult> uploadImage(
      {required String imageToUpload, required String title});
}
