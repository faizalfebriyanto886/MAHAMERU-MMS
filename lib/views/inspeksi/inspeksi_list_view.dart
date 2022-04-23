import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/controller/inspeksi/inspeksi_list_controller.dart';
import 'package:mahameru/static/color_app.dart';
import 'package:mahameru/views/inspeksi/inspeksi_tambah_view.dart';
import 'package:mahameru/widgets/appbar.dart';

class InspeksiListView extends StatefulWidget {
  final String title;
  const InspeksiListView({
    required this.title,
    Key? key 
  }) : super(key: key);

  @override
  State<InspeksiListView> createState() => _InspeksiListViewState();
}

class _InspeksiListViewState extends State<InspeksiListView> {
  final controller = Get.put(InspeksiListController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InspeksiListController>(
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
            onPressed: () {
              Get.to(() => InspeksiTambahView(title: "Inspeksi Baru"), transition: Transition.downToUp, duration: Duration(milliseconds: 700));
            },
            child: Icon(
              Icons.add,
            ),
          ),
          body: Center(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                ListTile(
                  title: Text(
                    "Sudah Pengecekan",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle: Text(
                    "20 Mei 2022",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Text(
                    "4",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                // Searching Field
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
                          hintText: "Cari Pengecekan Hari",
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
                  padding: EdgeInsets.all(5),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.inspeksiList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: null,
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        radius: 20,
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      title: Text(
                        controller.inspeksiVehicle[index]['nopol'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        controller.inspeksiList[index]['date_transaction'],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      trailing: Text(
                        controller.inspeksiList[index]['officer'],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                        ),
                      )
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