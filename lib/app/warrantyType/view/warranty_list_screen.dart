import 'package:cmms/app/warrantyType/view/warranty_listContent_mobile.dart';
import 'package:cmms/app/warrantyType/view/warranty_listContent_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

import '../warranty_list_controller.dart';

class WarrantyListScreen extends GetView<WarrantyListController> {
  WarrantyListScreen({super.key});
  final controller = Get.find<WarrantyListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              centerTitle: true,
              elevation: 0,
            )
          : null,
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer()
              : null,
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
                    if (Responsive.isMobile(context))
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
