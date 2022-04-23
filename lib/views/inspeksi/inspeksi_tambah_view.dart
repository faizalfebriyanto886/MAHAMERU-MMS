import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/widgets/appbar.dart';

class InspeksiTambahView extends StatefulWidget {
  final String title;
  const InspeksiTambahView({
    required this.title,
    Key? key
  }) : super(key: key);

  @override
  State<InspeksiTambahView> createState() => _InspeksiTambahViewState();
}

class _InspeksiTambahViewState extends State<InspeksiTambahView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUI().appBarWithBackButton(
        actionBackButton: () {
          Get.back();
        },
        actionButton: [],
        title: widget.title,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            ListTile(
              title: Text(
                "Kendaraan",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "Pilih Kendaraan",
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

            // tanggal pengecekan
            GestureDetector(
              onTap: null,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
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
            
            // jam mulai
            SizedBox(height: 20),
            GestureDetector(
              onTap: null,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Jam Mulai",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "20:20",
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

            ListTile(
              title: Text(
                "Nama Petugas",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Isi Nama Petugas",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}