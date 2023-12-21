import 'package:cmms/app/water_data/view/water_data_web.dart';
import 'package:cmms/app/water_data/water_data_controller.dart';
import 'package:cmms/app/water_data_list/view/water_data_list_web.dart';
import 'package:cmms/app/water_data_list/water_data_list_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class WaterDataScreen extends GetView<WaterDataController> {
  WaterDataScreen({super.key});

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
              title: Text('Calibration History'),
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
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: WaterDataWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
