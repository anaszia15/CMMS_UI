import 'package:cmms/app/employee_stock_report/employee_stock_report_controller.dart';
import 'package:cmms/app/employee_stock_report/view/employee_stock_report_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class EmployeeStockReportScreen extends GetView<EmployeeStockReportController> {
  EmployeeStockReportScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Module List'),
              centerTitle: true,
              elevation: 0,
            ),
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Row(
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
              Expanded(
                child: Column(
                  children: [
                    // if (Responsive.isMobile(context) ||
                    //     Responsive.isTablet(context))
                    //   Expanded(
                    //     child: EmployeeStockReportContentMobile(),
                    //   ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: EmployeeStockReportContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}