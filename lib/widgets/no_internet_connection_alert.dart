import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetConnectionAlert {
  mainAlert() {
    return Get.snackbar(
      "Koneksi internet!",
      "Cek koneksi internetmu dulu ya",
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      icon: Icon(
        Icons.warning,
        color: Colors.white,
      ),
      isDismissible: true,
      margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
    );
  }
}
