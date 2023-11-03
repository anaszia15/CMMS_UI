import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../calibration_certificate_controller.dart';
// import '../module_list_controller.dart';
import 'calibration_certificate_mobile.dart';
import 'calibration_certificate_web.dart';

class CalibrationCertificateScreen extends GetView<CalibrationCertificateController> {
  CalibrationCertificateScreen({super.key});

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
              title: Text('Calibration Certificate List'),
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
                        child: CalibrationCertificateMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: CalibrationCertificateWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
