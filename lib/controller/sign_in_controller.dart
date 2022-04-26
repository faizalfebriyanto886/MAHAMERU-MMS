import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/services/api_services.dart';
import 'package:mahameru/static/shared_preferences_key.dart';
import 'package:mahameru/views/dashboard/dashboard_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  //controller username
  TextEditingController? emailController;

  //controller password
  TextEditingController? passwordController;

  //boolean status apakah password bisa dilihat
  bool isPasswordVisible = false;

  //boolean untuk status proses login
  bool isLoading = false;

  static SignInController get controller => Get.find<SignInController>();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isPasswordVisible = false;
    super.onInit();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();

    super.dispose();
  }

  /*
  Method untuk mengubah visibilitas password
  */
  changeVisibilityPassword() {
    isPasswordVisible = !isPasswordVisible;

    //update adalah method bawaan dari Framework GetX untuk mengupdate state
    update();
  }

  /*
  Method untuk mengecek validitas apakah username dan passoword sudah terisi
  */
  validation() async {
    // ignore: avoid_print
    print(emailController!.text);
    // ignore: avoid_print
    print(passwordController!.text);

    if (emailController!.text.isEmpty || passwordController!.text.isEmpty) {
      return Get.snackbar(
        "Peringatan!",
        "Mohon lengkapi email ataupun katasandi",
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
    } else {
      signIn();
    }
  }

  signIn() async {
    isLoading = true;
    update();
    ApiServices apiServices = ApiServices();
    apiServices.postDataV2(
      url: "https://mahameru.solog.id/api/v4/login",
      isJson: true,
      parameters: {
        "username": emailController!.text.toString().trim(),
        "password": passwordController!.text.toString().trim(),
      },
    ).then((value) async {
      // ignore: avoid_print
      print("Response : $value");
      isLoading = false;
      update();
      if (value['message'] == "success") {
        var response = value['response'].data;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(SharedPreferencesKey.accessToken, response['api_token']);

        // ignore: avoid_print
        print(response);
        // ignore: avoid_print
        print("Token API = ${response['api_token']}");

        Get.off(() => DashboardView());
      } else if (value['message'] == "failed") {
        var response = value['response'].data;
        Get.snackbar(
          value['message'].toString().toUpperCase(),
          response['message'].toString(),
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
      } else {
        Get.snackbar(
          value['message'].toString().toUpperCase(),
          value['response'].toString(),
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
      update();
    });
  }



  debugLogin(){
    ApiServices apiServices = ApiServices();
    apiServices.postDataV2(
      url: "https://mahameru.solog.id/api/v4/login",
      isJson: true,
      parameters: {
        "username": "admin",
        "password":"12345",
      },
    ).then((value) {
      debugPrint("$value");
    });
  }
}
