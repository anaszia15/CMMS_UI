import 'package:cmms/app/add_inventory/view/add_inventory_ui.dart';
import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../navigators/app_pages.dart';
import '../incident_report_controller.dart';

class IncidentScreen extends GetView<IncidentReportController> {
  IncidentScreen({super.key});
  final IncidentReportController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get;

    final double itemHeight = (size.height - kToolbarHeight - 90) / 10;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;

    final double itemWidth = size.width / 3;

    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: HeaderWidget(),
              elevation: 0,
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
              : null,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Row(
          children: [
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? Dimens.box0
                :
                //
                HomeDrawer(),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isDesktop(context))
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Incident Report",
                          style: TextStyle(
                              color: Color.fromARGB(255, 159, 156, 156),
                              fontSize: 24,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(16),
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                      childAspectRatio: Responsive.isMobile(context)
                          ? (itemWidth / itemHeight)
                          : (itemWidth / itemHeightWeb),
                      children: <Widget>[
                        _inventoryList(
                            tittle: "Incident Report List",
                            ontap: () {
                              Get.toNamed(
                                Routes.incidentReportListWeb,
                              );
                              //  controller.createChecklist();
                            }),
                        _inventoryList(
                            tittle: "Incident Risk Type",
                            ontap: () {
                              Get.toNamed(
                                Routes.incidentRiskType,
                              );
                            }),
                        // _inventoryList(
                        //     tittle: "Inventory Category",
                        //     ontap: () {
                        //       Get.toNamed(
                        //         Routes.assetTypeListScreen,
                        //       );
                        //     }),
                        // _inventoryList(
                        //     tittle: "Inventory Type",
                        //     ontap: () {
                        //       Get.toNamed(
                        //       Routes.inventoryTypeListScreen,
                        //     );
                        //   }),
                        // _inventoryList(
                        //     tittle: "Inventory Status",
                        //     ontap: () {
                        //       Get.toNamed(
                        //         Routes.inventoryStatusListScreen,
                        //       );
                        //     }),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  _inventoryList({required String tittle, Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorValues.appLightBlueColor,
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.all(9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                tittle,
                style: TextStyle(
                    color: ColorValues.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 245, 245),
                border: Border.all(
                  color: ColorValues.whiteColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                Icons.format_list_bulleted,
                size: 30,
                color: ColorValues.appLightBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}