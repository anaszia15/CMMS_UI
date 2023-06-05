import 'package:cmms/app/warrantyType/view/warranty_listContent_mobile.dart';
import 'package:cmms/app/warrantyType/view/warranty_listContent_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/home_controller.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
// import '../module_list_controller.dart';
import '../warranty_list_controller.dart';
// import 'module_listContent_mobile.dart';
// import 'module_listContent_web.dart';

class WarrantyListScreen extends GetView<WarrantyListController> {
  WarrantyListScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Warranty List'),
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
                    if (Responsive.isMobile(context) ||
                        Responsive.isTablet(context))
                      Expanded(
                        child: WarrantyListContentMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: WarrantyListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}