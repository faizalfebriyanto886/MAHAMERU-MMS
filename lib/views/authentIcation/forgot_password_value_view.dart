import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mahameru/views/authentIcation/signin_view.dart';
import 'package:mahameru/widgets/button.dart';

class ForgotPasswordSuccessView extends StatelessWidget {
  const ForgotPasswordSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: Container(
          margin: EdgeInsets.only(left: 20.0),
          alignment: Alignment.centerLeft,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              Get.off(() => SignInView());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                size: 22,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimationConfiguration.staggeredList(
            position: 0,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Image.asset(
                    "assets/images/illustrations/Success _Monochromatic.png",
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
            ),
          ),
          AnimationConfiguration.staggeredList(
            position: 1,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  title: Text(
                    "Berhasil dikirim!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                    ),
                  ),
                  subtitle: Text(
                    "Silahkan Anda mengecek email dari sistem. Cek juga di folder spam, jika belum mendapatkan email verifikasi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimationConfiguration.staggeredList(
            position: 2,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 35,
                    right: 35,
                    top: 20,
                  ),
                  child: AppButton().whiteButton(
                    buttonColor: Colors.transparent,
                    textButton: "Masuk sekarang",
                    function: () {
                      Get.off(() => SignInView());
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
