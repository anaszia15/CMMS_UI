import 'package:cmms/app/app.dart';
import 'package:cmms/app/incident_report_dashboard/incident_report_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';

class IncidentReportDashboardScreen
    extends GetView<IncidentReportDashboardController> {
  IncidentReportDashboardScreen({super.key});
  final IncidentReportDashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get;

    final double itemHeight = (size.height - kToolbarHeight - 50) / 9;
    final double itemHeightWeb = (size.height - kToolbarHeight - 70) / 4;

    final double itemWidth = size.width / 2;

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
            SizedBox(
              height: 40,
            ),
            (Responsive.isMobile(context) || Responsive.isTablet(context))
                ? Dimens.box0
                :
                //
                HomeDrawer(),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isMobile(context))
                      Obx(
                        () => Container(
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                          ),
                        ),
                      ),
                    if (Responsive.isDesktop(context))
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              "Incident Report",
                              style: TextStyle(
                                color: Color.fromARGB(255, 159, 156, 156),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Add some space between the text and the line
                            Expanded(
                              child: Divider(
                                color: Colors
                                    .grey, // Customize the color of the line if needed
                                height:
                                    1, // Adjust the height of the line if needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(16),
                      crossAxisSpacing: 70,
                      mainAxisSpacing: 6,
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
                      childAspectRatio: Responsive.isMobile(context)
                          ? (itemWidth / itemHeight)
                          : (itemWidth / itemHeightWeb),
                      children: <Widget>[
                        _incidentReportList(
                            tittle: "Incident Report List",
                            ontap: () {
                              Get.toNamed(
                                Routes.incidentReportListWeb,
                              );
                            }),
                        //  if (Responsive.isDesktop(context))
                        _incidentReportList(
                            tittle: "Add Incident Report",
                            ontap: () {
                              Get.toNamed(
                                Routes.addIncidentReportContentWeb,
                              );
                            }),
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  _incidentReportList({required String tittle, Function()? ontap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorValues.skyBlueColor,
            borderRadius: BorderRadius.circular(2),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child:
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              Center(
            child: Text(
              tittle,
              style: TextStyle(
                  color: ColorValues.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),

              textAlign: TextAlign.center, //☺ Updated
            ),
          ),
          // SizedBox(
          //   height: 5,
          // ),
          // ],
          // ),
        ),
      ),
    );
  }
}