import 'package:cmms/app/audit_task_view/audit_task_view_controller.dart';
import 'package:cmms/app/audit_task_view/view/audit_task_view_content_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';

class AuditTaskViewScreen extends GetView<AuditTaskViewController> {
  AuditTaskViewScreen({super.key});

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
              title: Text('PM Task View'),
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
                        child: AuditTaskViewContentWeb(),
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget buildDocument() {
    return Container(
      child: Text('This is the body of the document.'),
    );
  }
}