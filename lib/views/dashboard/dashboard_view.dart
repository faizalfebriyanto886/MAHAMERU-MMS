import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahameru/views/authentIcation/signin_view.dart';
import 'package:mahameru/views/inspeksi/inspeksi_list_view.dart';
import 'package:mahameru/views/maintenance/maintenance_list_view.dart';
import 'package:mahameru/views/vehicle/vehicle_list_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListTile(
                contentPadding: EdgeInsets.only(top: 70, left: 10, right: 10),
                title: Text(
                  'Mon, 12 April 2022',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff535353),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: <WidgetSpan>[
                        WidgetSpan(
                          child: Text(
                            "Welcome, ",
                            style: TextStyle(
                              color: Color(0xFFC2C2C2),
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            child: Text(
                              "Admin",
                              style: TextStyle(
                                color: Color(0xFF000000),                                      
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Text(
                      'Cabang Makassar',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff535353),
                      ),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 5 ),
                  child: GestureDetector(
                    onTap: () {
                      Get.offAll(SignInView());
                    },
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: Color(0xff757575),
                      child: CircleAvatar(
                        radius: 24,
                        child: Image.asset(
                          "assets/images/avatar-new.png",
                          width: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardDasboard(
                    backgroundClr: Color(0xFF61B8FF).withOpacity(0.8),
                    descClr: Color(0xFF267871),
                    title: "114",
                    titleClr: Color(0xFFFFFFFF),
                    deskripsi: "Total kendaraan",
                    image: Image(image: AssetImage("assets/icons/truck.png"),
                     height: 20,
                     color: Color(0xFF9FC0FF),
                    ),
                    iconBackClr:  Color(0xFF03389D),
                  ),
                  cardDasboard(
                    backgroundClr: Color(0xFFC8E6FF).withOpacity(0.8),
                    descClr: Color(0xFF267871),
                    title: "112",
                    titleClr: Color(0xFF267871),
                    deskripsi: "Unit Beropreasi",
                    image: Image(image: AssetImage("assets/icons/reload.png"),
                      height: 20,
                      color: Color(0xFF267871),
                    ),
                    iconBackClr: Color(0xFF267871).withOpacity(0.24),
                  ),
                cardDasboard(
                  backgroundClr: Color(0xFFF2F9FF).withOpacity(0.8),
                  descClr: Color(0xFF267871),
                  title: "0",
                  titleClr: Color(0xFF85603F),
                  deskripsi: "Dalam Perawatan",
                   image: Image(image: AssetImage("assets/icons/reload.png"),
                    height: 20,
                    color: Color(0xFF85603F),
                   ),
                   iconBackClr: Color(0xFF85603F).withOpacity(0.24),
                ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: GridView.count(
                    crossAxisCount: 4,
                    childAspectRatio: 8/9,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                    children: [
                      cardMenu(
                        title: "Kendaraan", 
                        image: Image(image: AssetImage("assets/icons/truck.png"), height: 36,),
                        routeTo: () => Get.to(() => VehicleListView(title: 'Kendaraan',)),
                      ),
                      cardMenu(
                        title: "Ban", 
                        image: Image(image: AssetImage("assets/icons/tire.png"), height: 36,),
                        // ignore: avoid_returning_null_for_void
                        routeTo: () => null,
                      ),
                      cardMenu(
                        title: "Perawatan", 
                        image: Image(image: AssetImage("assets/icons/setting.png"), height: 36,),
                        routeTo: () => Get.to(() => MaintenanceListView(title: "Perawatan")),
                      ),
                      cardMenu(
                        title: "Cek KM", 
                        image: Image(image: AssetImage("assets/icons/speedo_meter.png"), height: 36,),
                        // ignore: avoid_returning_null_for_void
                        routeTo: () => null,
                      ),
                      cardMenu(
                        title: "Isu", 
                        image: Image(image: AssetImage("assets/icons/issue.png"), height: 36,),
                        // ignore: avoid_returning_null_for_void
                        routeTo: () => null,
                      ),
                      cardMenu(
                        title: "Inspeksi", 
                        image: Image(image: AssetImage("assets/icons/inspeksi.png"), height: 36,),
                        routeTo: () => Get.to(() => InspeksiListView(title: "Inspeksi")),
                      ),
                      cardMenu(
                        title: "Inventory", 
                        image: Image(image: AssetImage("assets/icons/inventory.png"), height: 36,),
                        // ignore: avoid_returning_null_for_void
                        routeTo: () => null,
                      ),
                      cardMenu(
                        title: "Laporan", 
                        image: Image(image: AssetImage("assets/icons/laporan.png"), height: 36,),
                        // ignore: avoid_returning_null_for_void
                        routeTo: () => null,
                      ),
                    ],
                )
              ),
            ),
            SizedBox(child: Image.asset("assets/images/logAktifitas.png")),
          ],
        ),
      )
    );
  }




  //Card for Dashboard

    cardDasboard({
    required Color backgroundClr,
    required Image image,
    required Color titleClr,
    required Color descClr,
    required Color iconBackClr,
    required String title,
    required String deskripsi,
  }){
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:backgroundClr,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400]!.withOpacity(0.6),
            spreadRadius:1,
            blurRadius: 10,
            offset: Offset(0, 16), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: iconBackClr,
              child: image,
            )
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only( left: 8),
                child: Text(title,
                  style:  TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: titleClr
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:6.0, left: 8),
                child: Text(deskripsi,
                  style:  TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: descClr
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  

  // for menu

  cardMenu({
    required String title,
    required Image image, 
    required VoidCallback routeTo
  }){
    return GestureDetector(
      onTap: routeTo,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            image,
            Text(title,
            style:  TextStyle(
              fontSize: 14,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
          ),
          ],
        ),
      ),
    );
  }
}

