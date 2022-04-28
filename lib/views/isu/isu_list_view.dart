import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/static/color_app.dart';
import 'package:mahameru/views/isu/isu_detail/isu_detail_view.dart';
import 'package:mahameru/widgets/appbar.dart';

class IssuListView extends StatefulWidget {
  const IssuListView({ Key? key }) : super(key: key);

  @override
  State<IssuListView> createState() => _IssuListViewState();
}

class _IssuListViewState extends State<IssuListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUI().appBarWithBackButton(
        actionBackButton: () {
          Get.back();
        },
        actionButton: [],
        title: "Isu",
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          // field Search
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
                  hintText: "Cari Isu",
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

          SizedBox(height: 10,),

          // list Issue
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => Get.to(() => IssueDetailView()),
                title: Row(
                  children: const [
                    Text(
                      "Driver",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(" • "),
                    Text(
                      "Andy S",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rem Aus",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Pengecek",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Text(" • "),
                        Text(
                          "Untung D",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[200],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red[200],
                          radius: 4,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "Selesai",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
                trailing: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black
                  ),
                  child: Text(
                    "B 9332 LI",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}