import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/maintenance/maintenance_detail/maintenance_detail_controller.dart';
import 'package:mahameru/widgets/appbar.dart';

class MaintenanceDetailView extends StatefulWidget {
  const MaintenanceDetailView({ Key? key }) : super(key: key);

  @override
  State<MaintenanceDetailView> createState() => _MaintenanceDetailViewState();
}

class _MaintenanceDetailViewState extends State<MaintenanceDetailView> {
  final controller = Get.put(MaintenanceDetailController());
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
            title: "Perawatan Detail",
          ),
          body: ListView(
            padding: EdgeInsets.all(10),
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: controller.maintenanceDetail.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[200],
                        ),
                        child: ListTile(
                          title: Text(
                            controller.maintenanceDetail[index]['code'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(
                            "Status : ${controller.maintenanceDetail[index]['']}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),

                      // title info Perawatan
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
                              "Info Perawatan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                            )
                          ],
                        ),
                      ),

                      // list perawatan
                      ListTile(
                        title: Text(
                          "Internal/Eksternal",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceDetail[index]['internal_eksternal'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Nama Perawatan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceDetail[index]['name'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Tanggal Rencana",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceDetail[index]['date_rencana'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Km Rencana",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceDetail[index]['km_rencana'].toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Status Perawatan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          "Pengajuan", // sek dummy
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Tgl Pengajuan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceDetail[index]['date_pengajuan'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Rencana Biaya Jasa",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceDetail[index]['cost_realisasi'].toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Vendor",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceVendor[index] == null ? "Data Kosong" : controller.maintenanceVendor[index]['name'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "KM Realisasi",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceDetail[index]['km_realisasi'].toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      // title info Perawatan
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
                              "Info Barang",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),

                      // List Barang
                      ListTile(
                        title: Text(
                          "Nama item",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceBarangItems[index] == null ? "Data Kosong" : controller.maintenanceBarangItems[index]['name'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Kategori",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceBarangItemsCategory[index] == null ? "Data Kosong" : controller.maintenanceBarangItemsCategory[index]['name'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Tipe Kegiatan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceBarang[index] == null ? "Data Kosong" : controller.maintenanceBarang[index]['tipe_kegiatan_name'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Qty Rencana",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceBarang[index] == null ? "Data Kosong" : controller.maintenanceBarang[index]['qty_rencana'].toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Harga Rencana",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceBarang[index] == null ? "Data Kosong" : controller.maintenanceBarang[index]['cost_rencana'].toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Total Rencana",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceBarang[index] == null ? "Data Kosong" : controller.maintenanceBarang[index]['total_rencana'].toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Qty Realisasi",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceBarang[index] == null ? "Data Kosong" : controller.maintenanceBarang[index]['qty_realisasi'].toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Harga Realisasi",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceBarang[index] == null ? "Data Kosong" : controller.maintenanceBarang[index]['cost_realisasi'].toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "Total Realisasi",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        trailing: Text(
                          controller.maintenanceBarang[index] == null ? "Data Kosong" : controller.maintenanceBarang[index]['total_realisasi'].toString(),
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
              )
            ],
          ),
        );
      }
    );
  }
}