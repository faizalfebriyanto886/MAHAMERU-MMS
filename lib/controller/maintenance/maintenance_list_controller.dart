import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MaintenanceListController extends GetxController {
  List maintenanceList = [];

  String selectedCategory = "All";
  List titleCategory = [
    "All",
    "Pengajuan",
    "Rencana",
    "Perawatan",
    "Selesai"
  ];

  // functions for selected category
  changeCategory(int index) {
    selectedCategory = titleCategory[index];

    // ignore: avoid_print
    print(selectedCategory);
  }

  // for filter status
  List filterPengajuan = [];
  List filterRencana = [];
  List filterPerawatan = [];
  List filterSelesai = [];

  @override
  void onInit() {
    super.onInit();
    getMaintenanceList();
  }
  getMaintenanceList() {
    serviceMaintenance(
      url: "http://mahameru.solog.id/api/vehicle/general_maintenance_datatable",
    ).then((value) {
      var response = value['response'].data['data'];
      maintenanceList.addAll(response);
      // ignore: avoid_print
      // print(response);
      response.forEach((element) {
        // ignore: avoid_print
        print(element);
        if (element['status'] == "1") {
          filterPengajuan.add(element);
        }
      });
      update();
    });
  }

  statusMaintenance(String status) {
    if (status == "1") {
      return status = "pengajuan";
    } else if (status == "2") {
      return status = "Rencana";
    } else if (status == "3") {
      return status = "Perawatan";
    } else if (status == "4" || status =="5") {
      return status = "selesai";
    } else {
      return status = "Not found";
    }
  }

  filterStatus() {
    
  }

  Future serviceMaintenance({
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