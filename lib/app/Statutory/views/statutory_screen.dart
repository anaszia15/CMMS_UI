import 'package:cmms/app/Statutory/statutory_controller.dart';
import 'package:cmms/app/Statutory/views/mobile/statutory_mobile.dart';
import 'package:cmms/app/Statutory/views/web/statutory_web.dart';
import 'package:cmms/app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class StatutoryScreen extends GetView<StatutoryController> {
  StatutoryScreen({super.key});
  final controller = Get.find<StatutoryController>();

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
                        child: StatutoryMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: StatutoryWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
