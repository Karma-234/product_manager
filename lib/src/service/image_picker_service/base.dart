import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ImageHandler {
  Future<File?> pickImage(ImageSource imageSource);
  // Future<String?> compressImage(File file);
}
