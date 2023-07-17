import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  RxString file = ''.obs;

  getImage(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image != null) {
      file.value = image.path.toString();
    } else {}
  }
}
