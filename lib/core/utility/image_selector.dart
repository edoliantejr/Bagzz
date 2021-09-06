import 'package:image_picker/image_picker.dart';

class ImageSelector {
  final ImagePicker _imagePicker = ImagePicker();
  Future<XFile?> selectImage() async {
    return await _imagePicker.pickImage(source: ImageSource.gallery);
  }
}
