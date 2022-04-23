import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:mahameru/widgets/flash.dart';

class FlashHelper{
  Future succes(BuildContext context, String title, String message) async {
    showFlash(
      duration: Duration(seconds: 2),
      context: context, 
      builder: (_, controller) {
        return Flas(
          controller: controller, 
          title: title, 
          messge: message, 
          icon: Icons.done,
          color: Colors.blue
        );
      }
    );
  }
  Future warning(BuildContext context, String title, String message) async {
    showFlash(
      duration: Duration(seconds: 2),
      context: context, 
      builder: (_, controller) {
        return Flas(
          controller: controller, 
          title: title, 
          messge: message, 
          icon: Icons.warning_amber,
          color: Colors.orange
        );
      }
    );
  }
  Future eror(BuildContext context, String title, String message) async {
    showFlash(
      duration: Duration(seconds: 2),
      context: context, 
      builder: (_, controller) {
        return Flas(
          controller: controller, 
          title: title, 
          messge: message, 
          icon: Icons.running_with_errors,
          color: Colors.red
        );
      }
    );
  }

  Future dialog(BuildContext context) async {
    showFlash(
      context: context, 
      builder: (_, controller){
        return Flash.dialog(
          controller: controller, 
          insetAnimationDuration: Duration(milliseconds: 200),
              insetAnimationCurve: Curves.easeInOut,
              barrierBlur: 0.5,
              backgroundColor: Colors.grey.withOpacity(0.4),
              margin: const EdgeInsets.only(left: 40.0, right: 40.0),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              boxShadows: [
                BoxShadow(
                  offset: Offset(0, 2),
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 6
                )
              ],
          child: Container(
            height: 250,
            width: double.infinity,
            color:  Colors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Text("Judul",
                          style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.withOpacity(0.7)
                        ),
                      ),
                      Divider(height: 10,),
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7)
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left:44, right: 44),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green.withOpacity(0.7),
                            boxShadow:  [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: Offset(1, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text("Ya",
                                  style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.7)
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()=> controller.dismiss(),
                            child: Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.red.withOpacity(0.7),
                              boxShadow:  [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: Offset(1, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text("Tidak",
                                    style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.7)
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        );
      }
    );
  }
}