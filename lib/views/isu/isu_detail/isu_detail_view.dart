import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/widgets/appbar.dart';

class IssueDetailView extends StatefulWidget {
  const IssueDetailView({ Key? key }) : super(key: key);

  @override
  State<IssueDetailView> createState() => _IssueDetailViewState();
}

class _IssueDetailViewState extends State<IssueDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUI().appBarWithBackButton(
        actionBackButton: () {
          Get.back();
        },
        actionButton: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Selesai",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ],
        title: "Isu Detail",
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTile(
                    contentPadding: EdgeInsets.only(right: 10, left: 10),
                    title: Text(
                      "Nomor Polisi",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    trailing: Text(
                      "B 2456 PL",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(right: 10, left: 10),
                    title: Text(
                      "Driver",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    trailing: Text(
                      "Nady S",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                      ),
                    ),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.only(right: 10, left: 10),
                    title: Text(
                      "Pengecek",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    trailing: Text(
                      "Untung D",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                      ),
                    ),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.only(right: 10, left: 10),
                    title: Text(
                      "Km Tempuh Saat Lapor",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    trailing: Text(
                      "14235 Km",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                      ),
                    ),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.only(right: 10, left: 10),
                    title: Text(
                      "Dibuat",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    trailing: Text(
                      "12 Mei 2021",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}