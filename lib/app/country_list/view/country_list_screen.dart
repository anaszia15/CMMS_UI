import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../country_list_controller.dart';
import 'country_listContent_mobile.dart';
import 'country_listContent_web.dart';

class CountryListScreen extends GetView<CountryListController> {
  CountryListScreen({super.key});
  final controller = Get.find<CountryListController>();

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
                        child: CountryListContentMobile(),
                      ),
                    if (Responsive.isDesktop(context))
                      Expanded(
                        child: CountryListContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
