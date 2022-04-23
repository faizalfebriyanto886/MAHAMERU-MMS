import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahameru/static/hexa_color.dart';
import 'package:mahameru/views/splash/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.white));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(GetMaterialApp(
      defaultTransition: Transition.topLevel,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      title: 'Mahameru MMS',
      theme: ThemeData(
        fontFamily: "Poppins",
        brightness: Brightness.light,
        primaryColor: HexaColor("#F5F5F5"),
        appBarTheme: AppBarTheme(color: HexaColor("#ffffff")),
        scaffoldBackgroundColor: HexaColor("#ffffff"),
        cardColor: HexaColor("#FFFFFF"),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreenView()
    ));
  });
}
