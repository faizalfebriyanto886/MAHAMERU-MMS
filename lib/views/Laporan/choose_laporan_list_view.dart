import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/views/Laporan/laporan_inventory_view.dart';
import 'package:mahameru/widgets/appbar.dart';

class ChooseLaporanListView extends StatefulWidget {
  const ChooseLaporanListView({ Key? key }) : super(key: key);

  @override
  State<ChooseLaporanListView> createState() => _ChooseLaporanListViewState();
}

class _ChooseLaporanListViewState extends State<ChooseLaporanListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUI().appBarWithBackButton(
        actionBackButton: () {
          Get.back();
        },
        actionButton: [],
        title: "Laporan",
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // inventory
          GestureDetector(
            onTap: () => Get.to(() => LaporanInventoryView()),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFFE08F62),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: Icon(
                      Icons.inventory,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  Text(
                    "Inventory",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 20,),

          // Type Management System
          GestureDetector(
            onTap: null,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFF8DB596),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: Icon(
                      Icons.circle_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  Text(
                    "Type Management System",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 20,),

          // Perawatan
          GestureDetector(
            onTap: null,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFF5D5B6A),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  Text(
                    "Perawatan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 20,),

          // Laporan Permintaan Pembelian
          GestureDetector(
            onTap: null,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0XFF4BAEA0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: Icon(
                      Icons.assignment,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  Text(
                    "Laporan Permintaan Pembelian",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}