import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class VehicleListController extends GetxController {
  List arrVehicle = []; // pendefinisian array list kendaraan
  List vehicleVariantList = [];
  List companyList = [];
  List supplierList = [];

  @override
  void onInit() {
    super.onInit();
    getAllVehicle();
  }
  getAllVehicle() {
    serviceVehicle(
      url: "http://mahameru.solog.id/api/vehicle/vehicle_datatable",
    ).then((value) {
      var response = value['response'].data['data'];

      // ignore: avoid_print
      print(response);
      arrVehicle.addAll(response);

      response.forEach((responseData) {
        companyList.add(responseData['company']);
        supplierList.add(responseData['supplier']);
        vehicleVariantList.add(responseData['vehicle_variant']);
      });
      update();
    });
  }

  Future serviceVehicle({
    required String url,
  }) async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // String tokenType = preferences.getString(SharedPreferencesKey.tokenType)!;
    // String accessToken = preferences.getString(SharedPreferencesKey.accessToken)!;
    String tokenTypeWithAccessToken = "Bearer gPzItwBpFwBKd2OK440YGIUQWvPvPS3y4zgtahBOi0rU3D3hKwqa8w6rf9ecdIve7BmYM7E6nHIyzK6xaJpMT9Q6XbHQo3cow86R";
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