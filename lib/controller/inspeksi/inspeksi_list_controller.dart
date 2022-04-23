import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

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
    Dio dio = Dio();
    String bearerToken = "Bearer enKvrNdLBQWZLp8FJzmjqVy32DdQ1sijVpP09HtK2PlzO3EASNHwd8OiPPXJP8A8kDNQLtiCeNETN2GLPHX75GNJeDaHYlS4TmkG";

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.headers["Authorization"] = bearerToken; // token masih dummy
    dio.options.headers["Content-Type"] = "application/json";

    try {
      var response  = await dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": bearerToken
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