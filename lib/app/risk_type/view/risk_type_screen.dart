import 'package:cmms/app/risk_type/view/risk_type_mobile.dart';
import 'package:cmms/app/risk_type/view/risk_type_web.dart';
import 'package:cmms/app/type_of_observation/view/type_of_obs_mobile.dart';
import 'package:cmms/app/type_of_observation/view/type_of_obs_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/home_controller.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../risk_type_controller.dart';

class RiskTypeScreen extends GetView<RiskTypeController> {
  RiskTypeScreen({super.key});

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
              title: Text('Risk Type List'),
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
                        child: RiskTypeMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: RiskTypeWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}