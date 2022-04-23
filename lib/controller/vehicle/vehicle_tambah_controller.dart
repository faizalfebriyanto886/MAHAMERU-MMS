import 'dart:io';

// import 'package:compotec/services/url.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class VehicleTambahController extends GetxController {
  List arrNameCompany = [];
  @override
  void onInit() {
    super.onInit();
    getVehicleChecklist();
  }

  getVehicleChecklist() {
    serviceVehicle(
      url: "http://mahameru.solog.id/api/vehicle/checklist_vehicle",
    ).then((value) {
      var response = value['response'];
      // ignore: avoid_print
      print(response.data['company']);
      arrNameCompany.addAll(response.data['company']);
      update();
    });
  }

  Future serviceVehicle({
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