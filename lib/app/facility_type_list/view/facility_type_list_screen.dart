import 'package:cmms/app/facility_type_list/facility_type_list_controller.dart';
import 'package:cmms/app/facility_type_list/view/facility_type_list_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'facility_listContent_mobile.dart';

class FacilityTypeListScreen extends GetView<FacilityTypeListController> {
  FacilityTypeListScreen({super.key});
  final controller = Get.find<FacilityTypeListController>();

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
                        child: FacilityTypeListContentMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: FacilityTypeListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
