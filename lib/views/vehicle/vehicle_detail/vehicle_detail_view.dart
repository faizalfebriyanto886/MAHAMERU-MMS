import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/vehicle/vehicle_detail/vehicle_detail_controller.dart';
import 'package:mahameru/widgets/appbar.dart';

class VehicleDetailView extends StatefulWidget {
  const VehicleDetailView({ Key? key }) : super(key: key);

  @override
  State<VehicleDetailView> createState() => _VehicleDetailViewState();
}

class _VehicleDetailViewState extends State<VehicleDetailView> {
  final controller = Get.put(VehicleDetailController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (context) {
        return Scaffold(
          appBar: AppBarUI().appBarWithBackButton(
            actionBackButton: () {
              Get.back();
            },
            actionButton: [],
            title: "Kendaraan Detail",
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: controller.vehicleDetail.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    //card detail
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue[200],
                      ),
                      child: ListTile(
                        title: Text(
                          controller.vehicleDetail[index]['nopol'],
                          // "B 4230 IO",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        subtitle: Text(
                          controller.vehicleDetail[index]['date_operation'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white70
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.blue[400],
                          child: Icon(
                            Icons.create,
                            color: Colors.white
                          ),
                        ),
                      )
                    ),

                    // title Info Vehicle
                    Padding(
                      padding: const EdgeInsets.only(left: 15 ,top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.blue[200],
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Info Kendaraan",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    ),

                    // list detail
                    ListTile( // Kode
                      title: Text(
                        "Kode",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['code'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // Wilayah
                      title: Text(
                        "Wilayah",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['company'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // Kepemilikan
                      title: Text(
                        "Kepemilikan",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['is_internal'] == 1 ? "Internal" : "Eksternal",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // pemilik
                      title: Text(
                        "Pemilik",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['supplier'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // model
                      title: Text(
                        "Model",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['variant_name'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "No. Sassis",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['chassis_no'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "No. Mesin",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['machine_no'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "Tipe kendaraan",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        "Light Truck Box",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "Kapasitas BBM",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['bbm_capacity'].toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "Warna",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['color'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "Tanggal Pembuatan",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['created_at'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "Mulai Operasi",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['updated_at'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "Status Vehicle",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['is_active'] == 1 ? "Aktif" : "Non Aktif",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    // vehicle certificate
                    Padding(
                      padding: const EdgeInsets.only(left: 15 ,top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.blue[200],
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Info Surat Kendaraan",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    ),

                    // List Surat kendaraan
                    ListTile( // No. Sassis
                      title: Text(
                        "No. STNK",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['stnk_no'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "Nama STNK",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['stnk_name'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    ListTile( // No. Sassis
                      title: Text(
                        "Masa Berakhir STNK",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['stnk_date'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),

                    // ListTile( // alamat stnk
                    //   title: Text(
                    //     "Alamat STNK",
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w500
                    //     ),
                    //   ),
                    //   trailing: Text(
                    //     controller.vehicleDetail[index]['stnk_address'],
                    //     style: TextStyle(
                    //       fontSize: 12,
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.normal
                    //     ),
                    //   ),
                    // ),

                    ListTile( // No. Sassis
                      title: Text(
                        "No. BPKB",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Text(
                        controller.vehicleDetail[index]['bpkb_no'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                  ],

                );
              },
            ),
          ),
        );
      }
    );
  }
}