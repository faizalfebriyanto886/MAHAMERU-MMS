import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleTambahCheckListBodyView extends StatefulWidget {
  const VehicleTambahCheckListBodyView({ Key? key }) : super(key: key);

  @override
  State<VehicleTambahCheckListBodyView> createState() => _VehicleTambahCheckListBodyViewState();
}

class _VehicleTambahCheckListBodyViewState extends State<VehicleTambahCheckListBodyView> {
  bool isChecked = false;

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
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 17),
              child: Text(
                "Simpan",
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
                  "Body Kendaraan",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 100),
                Text(
                  "43",
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
                "LAMPU SIGN BELAKAN KANAN",
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
                "LAMPU REM BELAKANG KIRI",
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
                "LAMPU MUNDUR BELAKANG KIRI",
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
                "HEADLAMP DEPAN KANAN",
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
                "LAMPU KOTA DEPAN KANAN",
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