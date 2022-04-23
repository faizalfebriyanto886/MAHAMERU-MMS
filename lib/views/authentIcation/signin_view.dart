import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/sign_in_controller.dart';
import 'package:mahameru/static/color_app.dart';
import 'package:mahameru/views/authentIcation/forgot_password_view.dart.dart';
import 'package:mahameru/views/dashboard/dashboard_view.dart';
import 'package:mahameru/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return  GetBuilder(
      init: controller,
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          bottomNavigationBar: Container(
            alignment: Alignment.center,
            height: 50,
            child: RichText(
              text: TextSpan(children: <WidgetSpan>[
                WidgetSpan(
                  child: Text(
                    "Fleetsumo by",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      " Pilarmedia",
                      style: TextStyle(
                        color: ColorApp.mainColorApp,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 40),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text('Selamat datang,',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 26)),
                  subtitle: RichText(
                    text: TextSpan(
                      children: const <WidgetSpan> [
                      WidgetSpan(
                        child: Text(
                          "Masuk dengan akun Fleetsumo",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      // WidgetSpan(
                      //   child: Text(
                      //     "",
                      //     style: TextStyle(
                      //       color: ColorApp.mainColorApp,
                      //       fontWeight: FontWeight.w600,
                      //       fontSize: 15,
                      //     ),
                      //   ),
                      // ),
                    ]),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 0.0, right: 20.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0),
                    ),
                    Container(
                        transform: Matrix4.translationValues(0.0, -8.0, 0.0),
                        child: Theme(
                            child: TextFormField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              cursorColor: ColorApp.mainColorApp,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  hintText: "Email disini...",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: ColorApp.mainColorApp,
                            ))),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 0.0, right: 20.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Katasandi",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0),
                    ),
                    Container(
                        transform: Matrix4.translationValues(0.0, -8.0, 0.0),
                        child: Theme(
                            child: TextFormField(
                              controller: controller.passwordController,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              cursorColor: ColorApp.mainColorApp,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              obscureText:
                                  controller.isPasswordVisible ? false : true,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.changeVisibilityPassword();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: controller.isPasswordVisible
                                            ? ColorApp.mainColorApp
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  hintText: "Katasandi disini...",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: ColorApp.mainColorApp,
                            ))),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.only(top: 0.0, right: 20.0, left: 20.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Get.to(() => ForgotPassword());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "Lupa password?",
                      style: TextStyle(
                          color: ColorApp.mainColorApp,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                alignment: Alignment.center,
                child: AppButton().mainButton(
                  textButton: "Login ke Fleetsumo",
                  function: () {
                    Get.to(()=> DashboardView());
                    // controller.validation();
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                alignment: Alignment.center,
                child: AppButton().mainButton(
                  textButton: "Kunjungi Fleetsumo.com",
                  function: () async {
                    String url = "https://www.fleetsumo.com/";
                    await canLaunch(url)
                        ? await launch(url)
                        : throw 'Could not launch $url';
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}