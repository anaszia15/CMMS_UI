import 'package:cmms/app/view_add_goods_orders.dart/view/stock_management_view_add_goods_orders_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../stock_management_view_add_goods_orders_controller.dart';

class ViewAddGoodsOrdersScreen extends GetView<ViewAddGoodsOrdersController> {
  ViewAddGoodsOrdersScreen({super.key});

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
              title: Text('Mrs'),
              centerTitle: true,
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
                  : HomeDrawer(),
              Expanded(
                child: Column(
                  children: [
                    // if (Responsive.isMobile(context) ||
                    //     Responsive.isTablet(context))
                    //   Expanded(
                    //     child: PreventiveChecklistListContentMobile(),
                    //   ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: ViewAddGoodsOrdersWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
