import 'dart:io';

import 'package:bagzz/models/bag_image_upload_result.dart';

abstract class CloudStorageService {
  Future<BagImageUploadResult> uploadImage(
      {required File imageToUpload, required String title});
}
