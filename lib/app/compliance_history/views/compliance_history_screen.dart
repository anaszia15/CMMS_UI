import 'package:cmms/app/compliance_history/compliance_history_controller.dart';
import 'package:cmms/app/compliance_history/views/mobile/compliance_history_mobile.dart';
import 'package:cmms/app/compliance_history/views/web/compliance_history_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

// ignore: must_be_immutable
class ComplianceHistoryScreen extends StatelessWidget {
  ComplianceHistoryScreen({Key? key});
  var controller = Get.find<ComplianceHistoryController>();

  ///
  @override
  Widget build(BuildContext context) //
  {
    return //
        Scaffold(
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text(
                "Compliance History",
                style: TextStyle(
                  color: Color.fromARGB(255, 159, 156, 156),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
            ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Row(children: [
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? Dimens.box0
              : HomeDrawer(),
          Expanded(
            child: Column(children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: KeyedSubtree(
                    key: UniqueKey(),
                    child: ComplianceHistoryWeb(),
                  ),
                )
              else
                Expanded(child: ComplianceHistoryMobile())
            ]),
          ),
        ]),
      ),
    );

    ///
  }
}