import 'dart:io';

import 'package:flutter_native_image/flutter_native_image.dart';

class AppImageCompress {
  Future<File?> compressFile({required File file, int? quality}) async {
    File compressedFile = await FlutterNativeImage.compressImage(
      file.path,
      quality: quality ?? 80,
    );
    return compressedFile;
  }
}
