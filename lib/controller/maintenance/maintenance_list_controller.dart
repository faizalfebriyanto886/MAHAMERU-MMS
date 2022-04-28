import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mahameru/static/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MaintenanceListController extends GetxController {
  bool isLoading = true;
  List maintenanceList = [];

  String selectedCategory = "Semua";
  List titleCategory = [
    "Semua",
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
      isLoading = false;
      // ignore: avoid_print
      for (var element in maintenanceList) {
        // ignore: avoid_print
        print(element);
        if (element['status'] == "1") {
          selectedCategory == "Semua";
        } else if (element['status'] == "2") {
          selectedCategory == "Pengajuan";
        } else if (element['status'] == "3") {
          selectedCategory == "Rencana";
        } else if (element['status'] == "4") {
          selectedCategory == "Perawatan";
        } else if (element['status'] == "5") {
          selectedCategory == "Selesai";
        }
      }
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

  filterStatus(int indexStatus) {
    selectedCategory = titleCategory[indexStatus];
    update();
    getMaintenanceList();
  }

  Future serviceMaintenance({
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