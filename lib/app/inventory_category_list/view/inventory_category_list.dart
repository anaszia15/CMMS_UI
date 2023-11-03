import 'package:cmms/app/inventory_category_list/view/inventory_category_list_mobile.dart';
import 'package:cmms/app/inventory_category_list/view/inventory_category_list_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../inventory_category_list_controller.dart';

class InventoryCategoryListScreen
    extends GetView<InventoryCategoryListController> {
  InventoryCategoryListScreen({super.key});

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
              title: Text('Inventory Type List'),
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
                        child: InventoryCategoryListMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: InventoryCategoryListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
