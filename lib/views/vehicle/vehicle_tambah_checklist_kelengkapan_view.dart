import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/views/vehicle/vehicle_tambah_checklist_body_view.dart';

class VehicleTambahChecklistKelengkapanView extends StatefulWidget {
  const VehicleTambahChecklistKelengkapanView({ Key? key }) : super(key: key);

  @override
  State<VehicleTambahChecklistKelengkapanView> createState() => _VehicleTambahChecklistKelengkapanViewState();
}

class _VehicleTambahChecklistKelengkapanViewState extends State<VehicleTambahChecklistKelengkapanView> {
  bool isChecked = false;
  List arrCheckList = [];
  @override
  Widget build(BuildContext context) {
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
            onTap: () => Get.to(() => VehicleTambahCheckListBodyView()),
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
          padding: EdgeInsets.all(20),
          children: [
            // title kelengkapan kendaraan
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[200],
                  radius: 5,
                ),
                // SizedBox(width: 10),
                Text(
                  "Kelengkapan Kendaraan",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 100),
                Text(
                  "13",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // header ada || berfungsi || baik
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Ada",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Berfungsi",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Kondisi",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // list kelengkapan vehicle
            ListTile(
              title: Text(
                "STNK",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "BUKU KIR",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),ListTile(
              title: Text(
                "SIM",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "Helm Safety",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "Seragam Safety",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "Alat Pemadam Api",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "Ganjal Ban",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "Sepatu",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "Senter & Baterai Cadangan",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "Masker",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "Air Radiator",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
            ListTile(
              title: Text(
                "Alat Komunikasi",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(                  
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Checkbox(
                    value: isChecked, 
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}