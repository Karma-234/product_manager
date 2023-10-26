import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'base.dart';

class ImageHandlerImpl extends ImageHandler {
  @override
  Future<File?> pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final result =
        await picker.pickImage(source: imageSource, imageQuality: 50);
    if (result == null) return null;
    return File(result.path);
  }
}
