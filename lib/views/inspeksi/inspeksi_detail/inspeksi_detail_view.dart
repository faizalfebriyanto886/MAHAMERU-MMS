import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/inspeksi/inspeksi_detail/inspeksi_detail_controller.dart';
import 'package:mahameru/widgets/appbar.dart';

class InspeksiDetailView extends StatefulWidget {
  const InspeksiDetailView({ Key? key }) : super(key: key);

  @override
  State<InspeksiDetailView> createState() => _InspeksiDetailViewState();
}

class _InspeksiDetailViewState extends State<InspeksiDetailView> {
  final controller = Get.put(InspeksiDetailController());
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBarUI().appBarWithBackButton(
            actionBackButton: () {
              Get.back();
            },
            actionButton: [],
            title: "Inspeksi Detail",
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.inspeksiListItem.length,
                  itemBuilder: (context, index) {
                    // ignore: unused_element
                    isCheckValue(valueCheck) {
                      controller.inspeksiChecklist[index][valueCheck] == 1 ? true : false;
                    }
                    return Column(
                      children: [
                        // card detail
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue[200],
                          ),
                          child: ListTile(
                            title: Text(
                              controller.inspeksiListItem[index]['officer'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.inspeksiListItem[index]['date_transaction'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                "Info Kelengkapan Kendaraan",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                                ),
                              )
                            ],
                          ),
                        ),

                        // info kendaraan 
                        ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(left: 15, right: 5),
                          children: [
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  "Ada",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey
                                  ),
                                ),
                                SizedBox(width: 19),
                                Text(
                                  "Berfungsi",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Kondisi",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey
                                  ),
                                ),
                                SizedBox(width: 20,),
                              ],
                            ),

                            // list kelengkapan Kendaraan
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
                                    value: controller.inspeksiChecklist[index]['id'] == 1 ? controller.inspeksiChecklist[index]['is_exist'] == 1 ? true : false : false,
                                    onChanged:  null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: controller.inspeksiChecklist[index]['id'] == 1 ? controller.inspeksiChecklist[index]['is_function'] == 1 ? true : false : false,
                                    onChanged: null
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: controller.inspeksiChecklist[index]['id'] == 1 ? controller.inspeksiChecklist[index]['condition'] == 1 ? true : false : false, 
                                    onChanged: null
                                  ),
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
                                    value: controller.inspeksiChecklist[index]['id'] == 1 ? controller.inspeksiChecklist[index]['is_exist'] == 1 ? true : false : true,
                                    onChanged:  null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: controller.inspeksiChecklist[index]['id'] == 1 ? controller.inspeksiChecklist[index]['is_function'] == 1 ? true : false : false,
                                    onChanged: null
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: false, 
                                    onChanged: null
                                  ),
                                ],
                              )
                            ),
                            ListTile(
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
                                    value: controller.inspeksiChecklist[index]['is_exist'] == 0 ? true : false,
                                    onChanged:  null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: controller.inspeksiChecklist[index]['is_function'] == 0 ? true : false,
                                    onChanged: null
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: controller.inspeksiChecklist[index]['condition'] == 0 ? true : false,
                                    onChanged: null
                                  ),
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
                                    onChanged: null
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
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
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
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
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
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
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
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
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
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
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.blue[200],
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Info Body Kendaraan",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),
                                  )
                                ],
                              ),
                            ),

                            // list Body kendaraan
                            ListTile(
                              title: Text(
                                "LAMPU SIGN DEPAN KIRI",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children:  [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU SIGN DEPAN KANAN",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),ListTile(
                              title: Text(
                                "LAMPU SIGN BELAKANG KIRI",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU SIGN BELAKANG KANAN",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU REM BELAKANG KANAN",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU REM BELAKANG KIRI",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU MUNDUR BELAKANG KIRI",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU MUNDUR BELAKANG KANAN",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "HEADLAMP DEPAN KANAN",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "HEADLAMP DEPAN KIRI",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU KOTA DEPAN KANAN",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU KOTA DEPAN KIRI",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),

                            ListTile(
                              title: Text(
                                "SEAT BELT DRIVER",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),

                            ListTile(
                              title: Text(
                                "SEAT BELT PASSANGER",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "BAN SEREP",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "BAN DEPAN",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "BAN BELAKANG",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "TOOLS KIT",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "DONGKRAK",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "STANG DONGKRAK",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "SEGITIGA PENGAMAN",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "SPION LUAR",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "SPION DALAM",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "TUTUP BENSIN",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU ROTARY",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LOGO KITRANS",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU DASHBOARD",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "LAMPU PLAFON",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "WIPER BLADE",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "KLAKSON",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: false, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: false, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: false, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "KEKENCANGAN BAUT RODA",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: false, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: false, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: false, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "SABUK PENGAMAN",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "KACA SPION",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "ALARM MUNDUR",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "KACA DAN WINDSHIELD",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "REM TANGAN",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "MINYAK KOPLING",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "AIR PEMBERSIH KACA",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(                  
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: true, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "AIR RADIATOR",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "OLI MESIN",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "ACCU",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "TANGKI SOLAR",
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
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 15),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  ),
                                  SizedBox(width: 10),
                                  Checkbox(
                                    value: isChecked, 
                                    onChanged: null,
                                  )
                                ],
                              )
                            ),
                            ListTile(
                              title: Text(
                                "KNALPOT",
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
                                    onChanged: null,
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
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
