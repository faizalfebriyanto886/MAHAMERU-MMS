import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/splash_screen_controller.dart';
import 'package:mahameru/static/color_app.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashscreenController());
    return GetBuilder(
      init: controller,
      builder: (_){
        return Scaffold(
          backgroundColor:ColorApp.mainColorApp,
          body: Center(
            child: AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: ColorApp.mainColorApp,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset("assets/icons/logo_fleetsumo.png",
                              height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:18.0),
                            child: Center(
                              child: Text("fleetsumo",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom:28.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text("Fleet Management System",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                    ),
                                  ),
                                  Text("v0.0.1",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}