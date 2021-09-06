import 'dart:io';

import 'package:bagzz/models/bag_image_upload.dart';

abstract class CloudStorageService {
  Future<BagImageUpload> uploadImage(
      {required File imageToUpload, required String title});
}
