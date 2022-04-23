import 'dart:async';

import 'package:get/get.dart';
import 'package:mahameru/static/shared_preferences_key.dart';
import 'package:mahameru/views/authentIcation/signin_view.dart';
import 'package:mahameru/views/dashboard/dashboard_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  static SplashscreenController get controller =>
      Get.find<SplashscreenController>();

  // * status untuk mengetahui apakah aplikasi sudah dalam keadaan login atau belum
  bool isLoggedIn = false;

  // * Method untuk mendapatkan status login dari shared preferences
  getStatusLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // check apakah shared preferences isLoggedIn tidak kosong?
    if (prefs.getBool(SharedPreferencesKey.isLoggedIn) != null) {
      // jika tidak kosong maka, maka shared preferences isLoggedIn akan di cek
      // apakah valuenya true atau false
      if (prefs.getBool(SharedPreferencesKey.isLoggedIn)!) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
    }
    update();
    onDoneLoading();
  }

  // * Method yang dijalankan setelah mendapatkan status login
  onDoneLoading() {
    // jika isLoggedIn sudah bernilai true
    // maka akan redirect ke main pages
    // jika false akan redirect ke signIn
    Timer(Duration(milliseconds: 2000), () {
      if (isLoggedIn) {
        Get.off(() => DashboardView());
      } else {
        Get.off(() => SignInView());
      }
    });
  }

  @override
  void onInit() {
    getStatusLogin();
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }
}
