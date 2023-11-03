import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'insurance_provider_listContent_mobile.dart';
import 'insurance_provider_listContent_web.dart';
import '../insurance_provider_listContent_controller.dart';


class InsuranceProviderScreen extends GetView<InsuranceProviderController> {
  InsuranceProviderScreen({super.key});

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
              title: Text('InsuranceProvider List'),
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
                        child: InsuranceProviderMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: InsuranceProviderWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
