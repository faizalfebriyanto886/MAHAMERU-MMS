import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mahameru/static/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InspeksiListController extends GetxController {
  List inspeksiList = [];
  List inspeksiVehicle = [];
  @override
  void onInit() {
    super.onInit();
    getInstpeksi();
  }

  getInstpeksi() async {
    serviceInspeksi(
      url: "http://mahameru.solog.id/api/vehicle/vehicle_check_datatable",
    ).then((value) {
      var response = value['response'].data['data'];
      // ignore: avoid_print
      print(response);
      inspeksiList.addAll(response);

      response.forEach((element) {
        inspeksiVehicle.add(element['vehicle']);
      });
      update();
    });
  }

  Future serviceInspeksi({
    required String url,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String accessToken = preferences.getString(SharedPreferencesKey.accessToken)!;
    String tokenType = "Bearer";

    String tokenTypeWithAccessToken = "$tokenType $accessToken";
    Dio dio = Dio();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.headers["Authorization"] = tokenTypeWithAccessToken;
    dio.options.headers["Content-Type"] = "application/json";

    try {
      var response  = await dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": tokenTypeWithAccessToken
          },
          followRedirects: true,
          validateStatus: (status) {
            return status! < 500;
          },
        )
      );

      if (response.statusCode == 200) {
        return {
          "response": response,
          "message": 'success'
        };
      } else {
        return {
          "response": response,
          "message": "failed"
        };
      }
    } on DioError catch (err) {
      // ignore: avoid_print
      print(err);
    }
  }
}