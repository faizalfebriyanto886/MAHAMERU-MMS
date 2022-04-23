import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/vehicle/vehicle_list_controller.dart';
import 'package:mahameru/static/color_app.dart';
import 'package:mahameru/views/vehicle/vehicle_detail/vehicle_detail_view.dart';
import 'package:mahameru/widgets/appbar.dart';

class VehicleListView extends StatefulWidget {
  final String title;
  const VehicleListView({ 
    required this.title,
    Key? key }) : super(key: key);

  @override
  State<VehicleListView> createState() => _VehicleListViewState();
}

class _VehicleListViewState extends State<VehicleListView> {
  final controller = Get.put(VehicleListController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VehicleListController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBarUI().appBarWithBackButton(
            actionBackButton: () {
              Get.back();
            },
            actionButton: [],
            title: widget.title,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue[200],
            onPressed: null,
            // () => Get.to(() => VehicleTambahView(title: "Kendaraan Baru"), transition: Transition.downToUp, duration: Duration(milliseconds: 700)),
            child: Icon(
              Icons.add,
            ),
          ),
          body: Center(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    child: Icon(
                      Icons.directions_car,
                      color: Colors.blue[200],
                    ),
                  ),
                  title: Text(
                    "Lihat Sebaran Kendaraan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                    "Kamu bisa lihat sebaran kendaraan disini",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
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

                // list vehicle
                ListView.builder(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.arrVehicle.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () => Get.to(() => VehicleDetailView(), arguments: controller.arrVehicle[index]['id']),
                          title: Row(
                            children: [
                              Text(
                                controller.companyList[index]['name'], // branch
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(" • ", style: TextStyle(color: Colors.grey),),
                              Text(
                                controller.arrVehicle[index]['supplier_id'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.vehicleVariantList[index]['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    
                              Row(
                                textDirection: TextDirection.ltr,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    controller.supplierList[index]['is_internal'] == 0 ? "Eksternal" : "Internal",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(" • ", style: TextStyle(color: Colors.grey),),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      controller.supplierList[index]['name'],
                                      softWrap: false,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blue[200],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                    
                              // circle 
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue[200],
                                    radius: 5,
                                  ),
                                  SizedBox(width: 10),
                                  Text("avaliable")
                                ],
                              ),
                            ],
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                            child: Text(
                              controller.arrVehicle[index]['nopol'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Divider(),
                        )
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