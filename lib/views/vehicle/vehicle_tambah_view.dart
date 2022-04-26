import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/vehicle/vehicle_tambah_controller.dart';
import 'package:mahameru/views/vehicle/vehicle_tambah_checklist_kelengkapan_view.dart';

class VehicleTambahView extends StatefulWidget {
  final String title;
  const VehicleTambahView({
    required this.title,
    Key? key 
  }) : super(key: key);

  @override
  State<VehicleTambahView> createState() => _VehicleTambahViewState();
}

class _VehicleTambahViewState extends State<VehicleTambahView> {
  final controller = Get.put(VehicleTambahController());

  String selectBranch = "";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VehicleTambahController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[200],
            title: Text(
              "Kendaraan Baru",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: "Poppins",
                color: Colors.white,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => Get.to(() => VehicleTambahChecklistKelengkapanView()),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 17),
                  child: Text(
                    "Selanjutnya",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Center(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )
                        ),
                        child: ListView.builder(
                          itemCount: controller.arrNameCompany.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Get.back(
                                  result: {
                                    "branch": controller.arrNameCompany[index]['name']
                                  }
                                );
                              },
                              title: Text(
                                controller.arrNameCompany[index]['name'],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                radius: 10,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 16,
                                ),
                              ),
                            );
                          },
                        )
                      )
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Branch",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      controller.arrNameCompany.isEmpty ? "Pilih Branch" : controller.arrNameCompany.toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                  ),
                ),

                // tanggal pengecekan
                GestureDetector(
                  onTap: null,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Tanggal Pengecekan",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "40 Maret 2022",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),
                ListTile(
                  title: Text(
                    "Nama Petugas",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Container(
                    height: 15,
                    transform: Matrix4.translationValues(0.0, 2.0, 0.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent
                          )
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent
                          )
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent
                          )
                        ),
                        hintText: "Isi Nama Petugas",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}