import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MaintenanceDetailController extends GetxController {
  List maintenanceDetail = []; // pendefinisian array list maintenance
  List maintenanceVendor = [];
  List maintenanceBarang = [];
  List maintenanceBarangItems = [];
  List maintenanceBarangItemsCategory = [];

  var id = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getMaintenanceDetail();
  }
  getMaintenanceDetail() {
    // ignore: avoid_print
    print(id);
    serviceMaintenance(
      url: "http://mahameru.solog.id/api/vehicle/show_vehicle_maintenance/$id",
    ).then((value) {
      var response = value['response'].data['item'];
      var responseDetail = value['response'].data['detail'];

      // ignore: avoid_print
      print(responseDetail);
      maintenanceDetail.add(response);
      maintenanceBarang.addAll(responseDetail);

      for (var elementDetail in maintenanceDetail) {
        maintenanceVendor.add(elementDetail['vendor']);
      }

      responseDetail.forEach((elementitem) {
        maintenanceBarangItems.add(elementitem['item']);
      });

      for (var elementItemCategory in maintenanceBarangItems) {
        maintenanceBarangItemsCategory.add(elementItemCategory);
      }
      update();
    });
  }

  Future serviceMaintenance({
    required String url,
  }) async {
    Dio dio = Dio();
    String bearerToken = "Bearer gPzItwBpFwBKd2OK440YGIUQWvPvPS3y4zgtahBOi0rU3D3hKwqa8w6rf9ecdIve7BmYM7E6nHIyzK6xaJpMT9Q6XbHQo3cow86R";

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