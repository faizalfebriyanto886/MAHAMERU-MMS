import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/vehicle/vehicle_detail/vehicle_detail_controller.dart';
import 'package:mahameru/static/color_app.dart';

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
      builder: (_) {
        return DefaultTabController(
          length: 7,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.keyboard_backspace_rounded, color: Colors.black),
                onPressed: () => Get.back(),
              ),
              title: Text(
                "Detail Kendaraan",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.5,
                  color: Colors.black,
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.blue[200],
                tabs: [
                  Tab(
                    child: Text(
                      "Detail Info",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Asuransi",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Body Kendaraan",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Kelengkapan Kendaraan",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Upload Berkas",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Ritase",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "BBM",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[200],
                      ),
                    ),
                  )
                ]
              ),
            ),
            // AppBarUI().appBarWithBackButton(
            //   actionBackButton: () {
            //     Get.back();
            //   },
            //   actionButton: [],
            //   title: "Detail Kendaraan",
            // ),
            body: TabBarView(
              children: [
                // Detail info tab
                Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    key: PageStorageKey('detailinfo'),
                    itemCount: controller.vehicleDetail.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children:[
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
                                  "Data Utama",
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
                              "Nomor Polisi",
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
              
                          // administrasi
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
                                  "Administrasi",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                  ),
                                )
                              ],
                            ),
                          ),
              
                          // administrasi List
                          ListTile(
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
                              "Masa Berlaku STNK",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Text(
                              "Sampai ${controller.vehicleDetail[index]['stnk_date']}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
              
                          ListTile( // alamat stnk
                            title: Text(
                              "Alamat STNK",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            subtitle: Text(
                              controller.vehicleDetail[index]['stnk_address'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
              
                          ListTile(
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

                          ListTile(
                            title: Text(
                              "KM/WH Kadaluwarsa",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Text(
                              controller.vehicleDetail[index] == null ? "-" : controller.vehicleDetail[index]['last_km_date'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),

                          ListTile(
                            title: Text(
                              "KM/WH Inisial",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Text(
                              controller.vehicleDetail[index] == null ? "-" : controller.vehicleDetail[index]['initial_km_date'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),

                          ListTile(
                            title: Text(
                              "Keur Kadaluarsa",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Text(
                              controller.vehicleDetail[index] == null ? "-" : controller.vehicleDetail[index]['kir_date'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),

                          // Operasional Use
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
                                  "Operasional Use",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                  ),
                                )
                              ],
                            ),
                          ),

                          // list Operasional Use
                          ListTile(
                            title: Text(
                              "Ratio Penggunaan BBM",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Text(
                              controller.vehicleDetail[index] == null ? "-" : controller.vehicleDetail[index]['bbm_usage_ratio'].toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),

                          ListTile(
                            title: Text(
                              "KM Inisial",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Text(
                              controller.vehicleDetail[index] == null ? "-" : controller.vehicleDetail[index]['initial_km_date'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),

                          ListTile(
                            title: Text(
                              "KM Akhir",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Text(
                              controller.vehicleDetail[index] == null ? "-" : controller.vehicleDetail[index]['last_km_date'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),

                          ListTile(
                            title: Text(
                              "Rata-rata KM",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Text(
                              controller.vehicleDetail[index] == null ? "-" : controller.vehicleDetail[index]['initial_km'].toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),

                          ListTile(
                            title: Text(
                              "Nomor GSM GPS",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            trailing: Text(
                              controller.vehicleDetail[index] == null ? "-" : controller.vehicleDetail[index]['gps_no'],
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

                // asuransi Tab
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    key: PageStorageKey('asuransi'),
                    physics: BouncingScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "Tugu  Pratama Indonesia",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "TLO",
                                  style: TextStyle(
                                    color: Colors.blue[200],
                                    fontSize: 12,
                                  ),
                                ),
                                Text(" • "),
                                Text(
                                  "20 Mei 2022",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(" • "),
                                Text(
                                  "20 Mei 2022",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.teal[300]
                              ),
                              child: Text(
                                "Aktif",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            SizedBox(height: 8,)
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Body Kerendaraan Tab
                Container(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Theme(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            textInputAction: TextInputAction.search,
                            cursorColor: ColorApp.mainColorApp,
                            style: TextStyle(
                              color: Colors.black,  
                              fontSize: 14,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              disabledBorder: UnderlineInputBorder(
                                borderSide:  BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder:  UnderlineInputBorder(
                                borderSide:  BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder:  UnderlineInputBorder(
                                borderSide:  BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              hintText: "Cari body Kendaraan",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              // icon: Icon(Icons.search, size: 30, color: Colors.blue.withOpacity(0.6),),
                            ),
                          ),
                          data: Theme.of(context).copyWith(
                            primaryColor: ColorApp.mainColorApp,
                          ),
                        ),
                      ),

                      SizedBox(height: 10), // space

                      // List Body Kendaraan
                      ListView.builder(
                        key: PageStorageKey('bodyKendaraan'),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Air Aki",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                ),
                                Text(
                                  "Sunardi",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue[200]
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 20,
                                  child: Checkbox(
                                    value: false,
                                    onChanged: null
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Ada",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                                Checkbox(
                                  value: false, 
                                  onChanged: null
                                ),
                                Text(
                                  "Berfungsi",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                                Checkbox(
                                  value: false, 
                                  onChanged: null
                                ),
                                Text(
                                  "Baik",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal
                                  ),
                                )
                              ],
                            ),
                            trailing: Text(
                              "20 Mei 2022",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),

                // Kelengkapan Kendaraan
                Container(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      // search field
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Theme(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            textInputAction: TextInputAction.search,
                            cursorColor: ColorApp.mainColorApp,
                            style: TextStyle(
                              color: Colors.black,  
                              fontSize: 14,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              disabledBorder: UnderlineInputBorder(
                                borderSide:  BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder:  UnderlineInputBorder(
                                borderSide:  BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder:  UnderlineInputBorder(
                                borderSide:  BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              hintText: "Cari body Kendaraan",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              // icon: Icon(Icons.search, size: 30, color: Colors.blue.withOpacity(0.6),),
                            ),
                          ),
                          data: Theme.of(context).copyWith(
                            primaryColor: ColorApp.mainColorApp,
                          ),
                        ),
                      ),

                      SizedBox(height: 10), // space

                      // List Body Kendaraan
                      ListView.builder(
                        key: PageStorageKey('bodyKendaraan'),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "STNK",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                ),
                                Text(
                                  "Sunardi",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue[200]
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 20,
                                  child: Checkbox(
                                    value: false,
                                    onChanged: null
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Ada",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                                Checkbox(
                                  value: false, 
                                  onChanged: null
                                ),
                                Text(
                                  "Berfungsi",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                                Checkbox(
                                  value: false, 
                                  onChanged: null
                                ),
                                Text(
                                  "Baik",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal
                                  ),
                                )
                              ],
                            ),
                            trailing: Text(
                              "20 Mei 2022",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),

                // Upload Berkas
                Container(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(
                          "Tambah File",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text(
                          "Tambahkan file dengan tekan tombol ini..",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                        trailing: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue.withOpacity(0.2),
                          child: Icon(Icons.add, color: Colors.blue, size: 18,),
                        ),
                      ),

                      // list Tambah File
                      
                    ],
                  ),
                ),

                // Ritase
                Center(
                  child: Text("Data Ritase Kosong"),
                ),

                // BBM
                Container(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      // search Field
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Theme(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              textInputAction: TextInputAction.search,
                              cursorColor: ColorApp.mainColorApp,
                              style: TextStyle(
                                color: Colors.black,  
                                fontSize: 14,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderSide:  BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                enabledBorder:  UnderlineInputBorder(
                                  borderSide:  BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder:  UnderlineInputBorder(
                                  borderSide:  BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: "Cari BBM",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                // icon: Icon(Icons.search, size: 30, color: Colors.blue.withOpacity(0.6),),
                              ),
                            ),
                            data: Theme.of(context).copyWith(
                              primaryColor: ColorApp.mainColorApp,
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        key: PageStorageKey('bbm'),
                        physics: BouncingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "DEPO MAKASSAR",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Bensin",
                                        style: TextStyle(
                                          color: Colors.blue[200],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      Text(" • ", style: TextStyle(color: Colors.grey),),
                                      Text(
                                        "2022-04-22 01:28:40",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.amber[300]
                                        ),
                                        child: Text(
                                          "Belum Diajukan",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.cyan[200]
                                        ),
                                        child: Text(
                                          "Manual",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              trailing: Text(
                                "80000",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}