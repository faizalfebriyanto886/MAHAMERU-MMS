import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/static/color_app.dart';
import 'package:mahameru/widgets/appbar.dart';

class CekKmListView extends StatefulWidget {
  const CekKmListView({ Key? key }) : super(key: key);

  @override
  State<CekKmListView> createState() => _CekKmListViewState();
}

class _CekKmListViewState extends State<CekKmListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUI().appBarWithBackButton(
        actionBackButton: () {
          Get.back();
        },
        actionButton: [],
        title: "Riwayat Cek KM",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.blue[200],
        child: Icon(
          Icons.filter_alt,
          color: Colors.white,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          // search form
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
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
                    hintText: "Cari Km",
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

          // list cek Km
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Klog Jakarta",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey
                      ),
                    ),
                    Text(
                      "1/B9401UELVHC95",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    )
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "20 Mei 2002",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        Text(" • "),
                        Text(
                          "512 KM",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue[200],
                            fontWeight: FontWeight.normal
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[200]
                      ),
                      child: Text(
                        "Via GPS",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white, 
                        ),
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
                trailing: Container(
                  padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                  ),
                  child: Text(
                    "B 2345 PO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}