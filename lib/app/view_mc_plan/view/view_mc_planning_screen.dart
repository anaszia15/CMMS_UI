import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/view_mc_plan/view/view_mc_planning_web.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/responsive.dart';

class ViewMcPlaningScreen extends GetView<ViewMcPlaningController> {
  ViewMcPlaningScreen({super.key});
  final controller = Get.find<ViewMcPlaningController>();

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
                        child: ViewMcPlaningWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
