import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/widgets/appbar.dart';

class LaporanInventoryView extends StatefulWidget {
  const LaporanInventoryView({ Key? key }) : super(key: key);

  @override
  State<LaporanInventoryView> createState() => _LaporanInventoryViewState();
}

class _LaporanInventoryViewState extends State<LaporanInventoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: null,
        child: Container(
          height: 50,
          color: Color(0XFF6C9CFA),
          child: Center(
            child: Text(
              "Tampilkan Report",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
          ),
        ),
      ),
      appBar: AppBarUI().appBarWithBackButton(
        actionBackButton: () {
          Get.back();
        },
        actionButton: [],
        title: "Laporan Inventory",
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: const [
          ListTile(
            title: Text(
              "Jenis Laporan",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "Pilih Jenis Laporan inventory",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text(
              "TBBM",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "Pilih TBBM inventory",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text(
              "Kategori",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "Aksesori MT",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text(
              "Periode Tanggal",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              "1 Mar 2020 - 31 Mar 2022",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500
              ),
            ),
            trailing: Icon(
              Icons.date_range,
              color: Colors.grey,
            ),
          )
        ],
      )
    );
  }
}