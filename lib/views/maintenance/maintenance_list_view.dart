import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/maintenance/maintenance_list_controller.dart';
import 'package:mahameru/static/color_app.dart';
import 'package:mahameru/views/maintenance/maintenance_detail/maintenance_detail_view.dart';
import 'package:mahameru/widgets/appbar.dart';

class MaintenanceListView extends StatefulWidget {
  final String title;
  const MaintenanceListView({
    required this.title,
    Key? key
  }) : super(key: key);

  @override
  State<MaintenanceListView> createState() => _MaintenanceListViewState();
}

class _MaintenanceListViewState extends State<MaintenanceListView> {
  final controller = Get.put(MaintenanceListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MaintenanceListController>(
      builder: (_) {
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: null,
              backgroundColor: Colors.blue[200],
              child: Icon(Icons.more_vert),
            ),
          ),
          appBar: AppBarUI().appBarWithBackButton(
            actionBackButton: () {
              Get.back();
            },
            actionButton: [],
            title: widget.title,
          ),
          body: controller.isLoading ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 10,),
                Text(
                  "Sedang Memuat Data",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          ) : Center(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.titleCategory.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Chip(
                          elevation: 2,
                          shadowColor: controller.selectedCategory == controller.titleCategory[index] ? Colors.white : Colors.grey[100],
                          backgroundColor: controller.selectedCategory == controller.titleCategory[index] ? Colors.blue[200] : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          label: InkWell(
                            onTap: () async {
                              setState(() {
                                controller.filterStatus(index);
                              });
                            },
                            child: Text(
                              controller.titleCategory[index],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: controller.selectedCategory == controller.titleCategory[index] ? Colors.white : Colors.black.withOpacity(0.8)
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // text field searching
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
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
                          hintText: "Cari ${ widget.title}...",
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
                
                SizedBox(height: 10),
                // list maintenance
                ListView.builder(
                  padding: EdgeInsets.only(bottom: 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.maintenanceList.length,
                  itemBuilder: (context, index) {
                    var statusCode = controller.maintenanceList[index]['status'];
                    Color? warna;

                    if (statusCode == '1') {
                      warna = Colors.yellow;
                    } else if (statusCode == '2') {
                      warna = Colors.blue[200];
                    } else if (statusCode == '3') {
                      warna = Colors.deepOrange[200];
                    } else if (statusCode == '4' || statusCode == '5') {
                      warna = Colors.green[200];
                    } else {
                      warna = Colors.red;
                    }

                    return Column(
                      children: [
                        ListTile(
                          onTap: () => Get.to(() => MaintenanceDetailView(), arguments: controller.maintenanceList[index]['id']),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.maintenanceList[index]['km_rencana']} Km",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                controller.maintenanceList[index]['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    controller.maintenanceList[index]['date_rencana'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(" • ", style: TextStyle(color: Colors.grey),),
                                  Text(
                                    controller.maintenanceList[index]['date_perawatan'] ?? "Tgl Kosong",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue[200],
                                    ),
                                  ),
                                ],
                              ),

                              // pill status
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: warna
                                ),
                                child: Text(
                                  controller.statusMaintenance(controller.maintenanceList[index]['status']),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black
                            ),
                            padding: EdgeInsets.all(7),
                            child: Text(
                              controller.maintenanceList[index]['nopol'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 9,)
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
