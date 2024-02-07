import 'package:cmms/app/stock_managment_goods_list_orders.dart/stock_management_goods_list_orders_controller.dart';
import 'package:cmms/app/request_order_details/view/request_order_details_web.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class StockManagementGoodsOrdersReqdetailsScreen extends GetView<StockManagementGoodsOrdersController> {
  StockManagementGoodsOrdersReqdetailsScreen({super.key});
  final controller = Get.find<StockManagementGoodsOrdersController>();

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
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Data Coming Soon......")),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: GoodsOrdersReqDetailsWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}