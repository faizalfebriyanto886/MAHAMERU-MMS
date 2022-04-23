import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mahameru/services/api_services.dart';
import 'package:mahameru/static/api_url.dart';
import 'package:mahameru/views/authentIcation/forgot_password_value_view.dart';
import 'package:mahameru/widgets/no_internet_connection_alert.dart';

class ForgotPasswordController extends GetxController {
  //controller username
  TextEditingController? emailController;

  //boolean untuk status proses
  bool isLoading = false;

  static ForgotPasswordController get controller =>
      Get.find<ForgotPasswordController>();

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController?.dispose();
    super.dispose();
  }

  /*
  Method untuk mengecek validitas apakah username dan passoword sudah terisi
  */
  validation() async {
    if (emailController!.text.isEmpty) {
      return Get.snackbar(
        "Peringatan!",
        "Mohon isi alamat email",
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        isDismissible: true,
        margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
      );
    } else {
      bool isOnline = await InternetConnectionChecker().hasConnection;
      if (isOnline) {
        forgotPassword();
      } else {
        NoInternetConnectionAlert().mainAlert();
      }
    }
  }

  forgotPassword() {
    isLoading = true;
    update();
    ApiServices apiServices = ApiServices();
    apiServices.postData(
      url: ApiUrl.getForgotPassword,
      isJson: true,
      parameters: {
        "email": emailController!.text.toString().trim(),
      },
    ).then((value) async {
      // ignore: avoid_print
      print("Response : $value");
      isLoading = false;
      update();
      if (value.statusCode == 200) {
        Get.offAll(() => ForgotPasswordSuccessView());
      } else {
        Get.snackbar(
          value.statusMessage!,
          value.data.toString(),
          backgroundColor: Colors.red[400],
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
    });
  }
}
